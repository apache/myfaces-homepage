# Apache MyFaces Core Concepts - ELResolver ordering
As with MyFaces core 2.0.2 (or 1.2.10) it is possible to change the predefined order or ELResolvers.
Standard order defined in the JSF 2.0 spec
* faces.ImplicitObjectELResolverForFaces
* faces.CompositeComponentAttributesELResolver
* el.CompositeELResolver (ELResolvers from faces-config and Application.addELResolver())
* faces.ManagedBeanELResolver
* faces.ResourceELResolver
* el.ResourceBundleELResolver
* faces.ResourceBundleELResolver
* el.MapELResolver
* el.ListELResolver
* el.ArrayELResolver
* el.BeanELResolver
* faces.ScopedAttributeELResolver

This order works great in every case, but is not always the fastest one, e.g. if you are using CDI,
because the CDI-ELResolver will be called many times for the most trivial ELExpressions, because he is installed via the faces-config and thus comes pretty early.

#### Changing the order
To change this predefined order you can provide a java.util.Comparator<ELResolver> implementation which will be applied to the List of ELResolvers mentioned above.
To install the comparator you simply have to set a web.xml config parameter:
```xml
<context-param>
    <param-name>org.apache.myfaces.EL_RESOLVER_COMPARATOR</param-name>
    <param-value>com.acme.el.MyELResolverComparator</param-value>
</context-param>
```

### Default implementations shipping with MyFaces core

MyFaces core already provides three implementations of java.util.Comparator<ELResolver>.
* `org.apache.myfaces.el.unified.OpenWebBeansELResolverComparator`: optimized for Apache OpenWebBeans
* `org.apache.myfaces.el.unified.CustomFirstELResolverComparator`: puts your custom ELResolvers to the first place
* `org.apache.myfaces.el.unified.CustomLastELResolverComparator`: puts your custom ELResolvers to the last place

To optimize the marriage of MyFaces and OpenWebBeans, you simply have to set the following config parameter:
```xml
<context-param>
    <param-name>org.apache.myfaces.EL_RESOLVER_COMPARATOR</param-name>
    <param-value>org.apache.myfaces.el.unified.OpenWebBeansELResolverComparator</param-value>
</context-param>
```

This moves the WebBeansELResolver almost to the last place in the ELResolver chain, thus improving the overall performance of ELExpression evaluations.

