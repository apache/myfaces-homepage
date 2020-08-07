# Apache MyFaces Core Concepts - View Pooling

The idea of the view pool comes from ideas of the community about how to improve JSF performance and the speculation behind how the state affects performance in web frameworks.
The primary perception was that a stateful web framework by definition does not have a good performance and a stateless web framework can be faster,
because a stateful web framework needs to deal with the "state" problem and that logic can expensive according to how it is implemented.  
  
But that way to see the problem is completely wrong, because in practice there are other things that can affect performance more significantly and with a good design it is possible to improve things to a very good level.
Proof of that is with the introduction of JSF 2.0 Partial State Saving (PSS), the perception changed,
because it was demonstrated that it is possible to reduce the state size used by the views of an application.  
  
In JSF 2.2 another step forward has been done with the introduction of "stateless JSF".
The idea is just mark the views in the application that does not require state to work properly, and then skip the state saving and restoring algorithm to improve performance.
It works for Mojarra but it doesn't have any effect with MyFaces because its PSS algorithm has been carefully designed and improved over a long time, and it is very efficient at the time of restore and save the state.

If the state is not the problem, or in other words, if the state calculation does not have a significant impact over performance, which one is the real problem? is there any problem?
The evidence gathered suggest there is not any problem, and the proof is that an application using MyFaces is very near in terms of performance than the same application written with hardcoded Servlets and JSP.

Why the solution using Servlets and JSP is the fastest one? There are two fundamental reasons:
* Everything should be written by hand, so there is no abstraction layer and in that way there is no overhead imposed by that layer.
* It uses the minimum possible amount of memory.

Please remember JSP pages are compiled into a servlet. The servlet creates a JSP tag tree and then this tree is processed. The result is most of the objects used by JSP are static constants.
Technically nothing will be as fast as Servlet/JSP. But the objective is not be the fastest framework. Instead, the objective is be as fast as possible without sacrifice the abstraction layer that provides JSF.

From other point of view, some tests done long time ago about JSF lifecycle and its performance in MyFaces suggest the following conclusions:
* Render the response involves about 70% of the processing time used by JSF.
* Build the view involves about 15%-20% of the processing time used by JSF.
* The time spent in traverse the component tree is a lot less than the time spent rendering the response or building the view.
* In ajax request, the relative time spent building the view can have more weight over the overall response time according to the size of the component tree and the operations involved in process the response.

According to the previous analysis, it is possible to improve the way how views are built to get better response times. There are some options:
* Use "static" views, or in other words, stateless views that can be used across multiple threads concurrently.
* Find a way to reuse the views.

The first option is not a good solution, because anyway there is some information that is inside UIComponent and should be stored per thread, and precisely UIComponent is a place specifically designed to store that information.
In fact, the first option is not really an option and it was discarded after some attempts.

## A new way to reuse views

Build a view can be described as a repetitive calculation. Many components are created and assembled in a predictable way with attributes that most of them are defined to their associated templates or facelets.

In JSF 2.0, PSS algorithm takes advantage of that predictable behavior and make a distinction between the "initial state" and the "delta state".
In this way, a view is a composition of the initial state and its delta state. But in the same way, if it is substracted the delta from the current state, the result is the initial state.
So, if we can somehow "substract" or "reset" the delta from the current state, we could derive a view into its initial state in the same way as a view is created from scratch.

In other words, we are taking advantage of the current JSF spec and we are taking it to the next level. PSS algorithm can be used to check if a view has been modified or not, checking its state.
That information can help us to decide if a component is reusable (no state) or not (with state).
If the component has state, the idea is reset the state and get it back to the initial state defined by the first call of markInitialState().

This can be done quite easily adding a context attribute `oam.view.resetSaveStateMode` and checking the value of that attribute and take proper actions into saveState() method.
here are two modes: soft reset [1] and hard reset [2]. A soft reset clears the "transient" state or those internal attributes used by the component but it does not clear the "delta" state.
A hard reset destroy both the "transient" state and the "delta" state. If the component cannot be reset, saveState() should return a non null value.

If a component in a view cannot be reset fully, it is possible to just remove the component from the tree and use facelets refreshing algorithm to rebuild the missing part and reuse a view partially.

But according to the spec, create a full view involves the following steps:
* Call `vdl.createMetadataView(...)` and call internally `ViewHandler.createView(...)` or just call `ViewHandler.createView(...)`
* Call `vdl.buildView(...)`

In the case of UIViewRoot, we can just take a "snapshot" of the component and exclude it from the reuse step. So the view pool does not reuse the root node but all the children, excluding the content of f:metadata facet.

There exists 4 fundamental attributes that define a view in JSF:
* viewId
* locale
* renderKitId
* contracts

This means if a view has the same values for the previous attributes, we can consider the structure is the same and the view can be reused partially or fully.
The pool uses these attributes as a key to group similar views, so there are different sets of views according to these values.

But a view can have a different structure too if it is used one of the following facelets tags.

According to its dynamic behavior, views can be classified into two groups: "static structure views" and "dynamic structure views".
This distinction is important because dynamic structure views requires a special treatement.

There are two basic operation that any pool must do: create objects and store them in the pool and take the objects from the pool.
In the JSF lifecycle, there are the following points where the pool must take some action:
* At the first request, the view and the view metadata are created on restore view phase. Later, the view is filled when vdl.buildView(...) is called on render response phase. In this moment the algorithm can take a view from the pool. Here there are three cases:
 * If the view is partial it requires to be refreshed by the vdl to restore the missing parts.
 * If the view is complete but dynamic, since we don't know how the dynamic portion of the view can change, it falls in the same case as a partial view and it should be refreshed by the vdl.
 * If the view is complete but static, the view is ready to use.
* If the view does not require state saving (does not contains h:form instances), after the view is rendered we can do a hard reset over the view and store it into the pool. In other words, we just discard the transient and delta state from the view, calling vdl.saveState(...). In a strict sense, in vdl.saveState(...) under hard reset mode, no state is saved but the view is stored into the pool.
* If the view requires state saving, the algorithm will call StateManager.saveState(...) and in that way vdl.saveState(...) . In this point the algorithm saves the delta state, reset the view and store it into the pool.
* In a postback, when the view is restored (StateManagementStrategy.restoreView), we can try to extract the dynamic portion of the view from the state. If there is no dynamic state, the view is static and the inner call of vdl.buildView will take it from the pool. If there is dynamic state, we can take a dynamic view from the pool using the dynamic state.
* When there is a navigation, there is a way to store the view that is left behind into the pool. The idea is change the default ActionListenerImpl and ensure handleNavigation() is called before the end of the current phase, or in other words doing a "deferred navigation". This is necessary to ensure the view is in a stable state, because the ActionListener is activated while the tree is traversed. By default this behavior is disabled.

## Configuration

The pool has the following web config parameters:
* `org.apache.myfaces.VIEW_POOL_MAX_POOL_SIZE` : Indicates the number of views stored in the pool per key.
* `org.apache.myfaces.VIEW_POOL_MAX_DYNAMIC_PARTIAL_LIMIT` : Indicates the number of dynamic views that can be reused as partial views.
* `org.apache.myfaces.VIEW_POOL_ENTRY_MODE` : Indicates how the view is hold by a "soft" or a "weak" reference into the pool. It affects how GC collects the views.
* `org.apache.myfaces.VIEW_POOL_DEFERRED_NAVIGATION` : reuse views that are navigated using default algorithm (increase reusal but it uses a hack that does not follow jsf spec) ).

There are two ways to enable a view to be used by the view pool:

Add an entry into a faces-config.xml file like this (with this mode you can override the global web config parameters):
```xml
<faces-config-extension>
    <view-pool-mapping>
        <url-pattern>/*</url-pattern>
        <parameter>
            <name>org.apache.myfaces.VIEW_POOL_MAX_POOL_SIZE</name>
            <value>5</value>
        </parameter>
    </view-pool-mapping>
</faces-config-extension>
```

Or encapsulate your top level page with:
```xml
<f:view oamEnableViewPool=true>
```

> :warning: **If the view is marked as "transient" or stateless and poolable at the same time the view pool will disabled, because the view pool reuse the state saving algorithm.**

## Final Thoughts and Conclusions

The disadvantages of the view pooling technique are:
* All components used in a view that uses view pooling must be compatible with the technique. The reason is some components has some variables that are not part of the state, but plays an important role. For example, in UIData there is a variable used to hold the dataModel and if a reset is required, the model must be cleared. In other cases, since all state is contained in the inner StateHelper instance provided by MyFaces implementation through UIComponentBase, there is no need to do anything else to make it compatible. If a component extends from UIComponent directly, it should add the necessary code to reset the view in saveState(...) method.
* The view pool uses state saving algorithm to decide if a view is reusable or not, but this detection technique is not 100% failsafe if the component is not compatible.
* Listeners subscribed using a facelet tag handler that invokes UIViewRoot.subscribeToViewEvent(...) may not work as expected, because the tag handler is not executed at each request, and these listeners are not saved/restored with the view state and needs to be subscribed at each request.

The following improvements has been confirmed after some performance tests done with the know demo application used in the performance comparison:
* A reduction of 25% of the transient memory used, which means a lot less memory is used and it is used at a slower pace. It also means less GC calls and a better CPU usage.
* An improvement of 9% over throughput for non AJAX requests.
* An improvement from 9% to 30% or even more for AJAX request, according to the tree size.

Note these measures depends on the application studied but it can give an idea about what to expect.

The recommendation is first evaluate your application requirements and use this technique only in cases where performance is a critical concern.
Most of the time an application using MyFaces without the view pool is good enough.
It is a good idea to select the views that receives the higher load and use the pool in only those cases, but that decision depends on the available memory and the load you application must face.
If the view is too dynamic, disable the pool could give better results.

