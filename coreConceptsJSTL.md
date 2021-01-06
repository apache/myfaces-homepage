# Apache MyFaces Core Concepts - Using JSTL tags with Facelets

JSTL (JSP Standard Tag Library) is a legacy JSP-based tag library which originally provided tags to control flow in JSP pages. Support for a subset of JSTL has additionally been provided for Facelets. JSTL core tags provided by Facelets include `c:catch`, `c:choose`, `c:if`, `c:forEach`, `c:otherwise`, `c:set`, and `c:when`. The Facelet javadoc can be found [here](https://myfaces.apache.org/core30/myfaces-impl/tlddoc-facelets/c/tld-summary.html)

## Pitfalls 

There are a few considerations to keep in mind when using JSTL core tags in JSF Facelet pages. Primarily, developers must understand that JSTL tags work as TagHandlers, and not as JSF components. This means that JSTL tags will never become part of the JSF component tree - JSTL tags only run during view build time to affect the flow of the creation of the JSF component tree, and so JSTL tags can’t have access to data and values that are only available in later phases of the JSF lifecycle. Consider the following example:

```
<h:dataTable values="${items}" var="item”>
    <c:if test="${item.enabled}”> // always evaluates to false
      …
    </c:if>
</h:datatable>
```

In this case, the `<c:if>` tag will be evaluated when the tree is built, at which time `item` is not available - so the `<c:if>` will always return false. A workaround for that case would be to replace the `<c:if>` tag with a JSF component that uses `rendered`, ie. `<ui:fragment rendered="…”/>`.

## Limitations

In general, it is preferable to use JSF components like `ui:repeat` in place of JSTL tags like `c:forEach` when possible, since JSTL core tags do not always work well with the JSF lifecycle - for an example see [MYFACES-4318](https://issues.apache.org/jira/browse/MYFACES-4318).

 JSTL core tags should only be used when control is needed over JSF component tree construction, and even in those cases developers must take care to understand the pitfalls.

## Configuration 

MyFaces has configurable JSTL behavior. Originally, Facelets was donated to both MyFaces and Mojarra, so both implementations had similar JSTL behaviors (and problems). Over time, the JSTL TagHandlers provided by MyFaces were refactored and improved to address long-standing bugs in the original Facelets implementation. The new (default) JSTL TagHandlers provide better performance and behavior, but for the sake of compatibility the original "legacy" JSTL TagHandlers are still provided with MyFaces. Those "legacy” TagHandlers can be enabled with the following custom property:

```
<context-param> 
    <param-name>org.apache.myfaces.STRICT_JSF_2_FACELETS_COMPATIBILITY</param-name>
    <param-value>true</param-value>
</context-param> 
```

This fallback is intended to be used by applications that require the old (and buggy) logic from facelets 1.1.x. See [MYFACES-3810](https://issues.apache.org/jira/browse/MYFACES-3810) for more information.

## Further reading
* [JSF c:forEach vs ui:repeat](https://rogerkeays.com/jsf-c-foreach-vs-ui-repeat)
* [StackOverflow: About JSTL](https://stackoverflow.com/tags/jstl/info)
* [StackOverflow: JSTL in JSF2 Facelets… makes sense?](https://stackoverflow.com/questions/3342984/jstl-in-jsf2-facelets-makes-sense)
* [Build time vs. render time](https://drewdev.blogspot.com/2008/03/build-time-vs-render-time.html)