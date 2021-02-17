# Apache MyFaces Core Concepts - Cache EL Expressions

Since MyFaces Core 2.0.8 / 2.1.2, a new optimization was added to prevent create EL Expressions unnecessarily.
Each time a page is build, facelets compiler create all EL expressions, and then evaluate them, so with this special configuration, you can reduce the time and memory resources required to build a view.  
Just add this to your web.xml file:

```xml
<context-param>
    <param-name>org.apache.myfaces.CACHE_EL_EXPRESSIONS</param-name>
    <param-value>alwaysRecompile</param-value>
</context-param>
```

There are the following valid modes for this param:
* `noCache`: All expression are created each time the view is built.
* `always`: Only does not cache when expressions are inside user tags or the expression contains a variable resolved using VariableMapper.
* `allowCset`: Like "always", but does not allow cache when ui:param was used on the current template context.
* `strict`: Like "allowCset", but does not allow cache when c:set with var and value properties only is used on the current page context. Any usage of c:if and ui:param will prevent cache inner EL expressions. 
* `alwaysRecompile` (recommended, since 2.1.12): When the algorithm detects a new user tag attribute or parameter, it recompiles the facelet again and mark the expressions that should not be cached, solving the problem related with ui:param or user tag attributes detected previously with `always` mode. Related issue in JIRA is MYFACES-3711

To enable this optimization, you should check first some tips to see which option can be enabled in your application.



## Downside `always`
a.xhtml
```xml
<ui:composition template="c.xhtml">
    <ui:param name="var1" value="value1"/>
</ui:composition>
```

b.xhtml
```xml
<ui:composition template="c.xhtml">
    <ui:param name="var1" value="value1"/>
    <ui:param name="var2" value="value2"/>
</ui:composition>
```

c.xhtml
```xml
<ui:composition>
   <h:outputText value="#{var1}"/>
   <h:outputText value="#{var2}"/>
</ui:composition>
```
If a.xhtml view is constructed before b.xhtml, #{var2} will be cached, even if this is not wanted and then when b.xhtml is called, the expression will not work correctly.

So the first tip to use this param is check if your composition declarations (ui:include, ui:decorate, ui:composition) always use the same number of params.


## Downside `allowCset` / `always`
csetuse.xhtml
```xml
<c:if test="....">
    <c:set var="attribute1" value="somevalue" />
</c:if>

<!-- some use of attribute1 -->
```

The problem here consists in a ValueExpression is created conditionally, but if the ValueExpression is not created the first time, other value expressions will not be marked as cacheable.
The solution is use this syntax instead:

csetuse.xhtml
```xml
<c:set var="attribute1" value="#{somecondition ? 'somevalue' : null}"/>
```

In this way, any use of attribute1 will detect and handle the expression correctly.

In `strict` mode, any usage of the previous two tags (c:if and ui:param) will prevent cache inner EL expressions. The mode "noCache" (by default) will always recreate expressions each time the view is build.

Related issue MYFACES-3160

