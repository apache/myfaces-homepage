# Apache MyFaces Core 2.0

Implementation of the JavaServer™ Faces (JSF) 2.0 specification.

## Requirements
* Java 1.5
* Servlet 2.5
* EL 2.1
* CDI 1.0 (optional)
* JSTL 1.2 (optional)
* BV 1.0 (optional)

## Source
[Apache GitBox](https://gitbox.apache.org/repos/asf?p=myfaces.git;a=shortlog;h=refs/heads/2.0.x) / [GitHub](https://github.com/apache/myfaces/tree/2.0.x)

## Downloads

|     | Mirrors                                                                                                                      | Checksum                                                                                                                     | Signature                                                                                                                                |
|-----------------|------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------|
| binary (tar.gz) | [myfaces-core-assembly-2.0.25-bin.tar.gz](http://www.apache.org/dyn/closer.lua/myfaces/binaries/myfaces-core-assembly-2.0.25-bin.tar.gz) | [myfaces-core-assembly-2.0.25-bin.tar.gz.sha512](https://downloads.apache.org/myfaces/binaries/myfaces-core-assembly-2.0.25-bin.tar.gz.sha512) | [myfaces-core-assembly-2.0.25-bin.tar.gz.asc](https://downloads.apache.org/myfaces/binaries/myfaces-core-assembly-2.0.25-bin.tar.gz.asc) |
| binary (zip)    | [myfaces-core-assembly-2.0.25-bin.zip](http://www.apache.org/dyn/closer.lua/myfaces/binaries/myfaces-core-assembly-2.0.25-bin.zip)       | [myfaces-core-assembly-2.0.25-bin.zip.sha512](https://downloads.apache.org/myfaces/binaries/myfaces-core-assembly-2.0.25-bin.zip.sha512)       | [myfaces-core-assembly-2.0.25-bin.zip.asc](https://downloads.apache.org/myfaces/binaries/myfaces-core-assembly-2.0.25-bin.zip.asc)       |
| source (tar.gz) | [myfaces-core-assembly-2.0.25-src.tar.gz](http://www.apache.org/dyn/closer.lua/myfaces/source/myfaces-core-assembly-2.0.25-src.tar.gz)   | [myfaces-core-assembly-2.0.25-src.tar.gz.sha512](https://downloads.apache.org/myfaces/source/myfaces-core-assembly-2.0.25-src.tar.gz.sha512)   | [myfaces-core-assembly-2.0.25-src.tar.gz.asc](https://downloads.apache.org/myfaces/source/myfaces-core-assembly-2.0.25-src.tar.gz.asc)   |
| source (zip)    | [myfaces-core-assembly-2.0.25-src.zip](http://www.apache.org/dyn/closer.lua/myfaces/source/myfaces-core-assembly-2.0.25-src.zip)         | [myfaces-core-assembly-2.0.25-src.zip.sha512](https://downloads.apache.org/myfaces/source/myfaces-core-assembly-2.0.25-src.zip.sha512)         | [myfaces-core-assembly-2.0.25-src.zip.asc](https://downloads.apache.org/myfaces/source/myfaces-core-assembly-2.0.25-src.zip.asc)         |

## Release Verification
Steps for checksum & signature verification can be found [here](/releaseVerification.md)

## Dependency
```xml
<dependency>
  <groupId>org.apache.myfaces.core</groupId>
  <artifactId>myfaces-api</artifactId>
  <version>2.0.25</version>
</dependency>
<dependency>
  <groupId>org.apache.myfaces.core</groupId>
  <artifactId>myfaces-impl</artifactId>
  <version>2.0.25</version>
</dependency>
```

## Configuration

MyFaces core behavior can be customized, adding some web config params into your WEB-INF/web.xml or META-INF/web-fragment.xml file for your custom project in this way:

```xml
<context-param>
	<param-name>org.apache.myfaces.SOME_USEFUL_PARAM</param-name>
	<param-value>someValue</param-value>
</context-param>
```

> :warning: **The table below uses `o.a.m` as shortcut for `org.apache.myfaces`**

### Common
| Name | Since | Default value | Expected values | Description |
| ---- | ---- | ---- | ---- | ---- |
| javax.faces.PROJECT_STAGE | 2.0 | Production | Development, Production, SystemTest, UnitTest | Indicate the stage of the initialized application |
| javax.faces.FACELETS_BUFFER_SIZE | 2.0 | 1024 |  | Define the default buffer size value passed to ExternalContext.setResponseBufferResponse() and in a servlet environment to HttpServletResponse.setBufferSize() |
| javax.faces.FACELETS_DECORATORS | 2.0 |  |  | Set of class names, separated by ';', implementing TagDecorator interface, used to transform a view definition in a facelet abstract syntax tree, that is used later to generate a component tree |
| javax.faces.FACELETS_LIBRARIES | 2.0 |  |  | Set of .taglib.xml files, separated by ';' that should be loaded by facelet engine. |
| javax.faces.FACELETS_REFRESH_PERIOD | 2.0 | -1 |  | Define the period used to refresh the facelet abstract syntax tree from the view definition file |
| javax.faces.FACELETS_SKIP_COMMENTS | 2.0 |  |  | Skip comments found on a facelet file |
| javax.faces.CONFIG_FILES | 1.1 |  |  | Comma separated list of URIs of (additional) faces config files |
| javax.faces.LIFECYCLE_ID | 1.1 |  |  | Identify the Lifecycle instance to be used |
| javax.faces.FACELETS_RESOURCE_RESOLVER | 2.0 |  |  | Class implementing ResourceResolver interface used to locate facelet resources |
| o.a.m.CONFIG_REFRESH_PERIOD | 1.1 | 2 |  | Set the time in seconds that check for updates of web |
| o.a.m.DELEGATE_FACES_SERVLET | 1.2.7 |  |  | Define an alternate class name that will be used to initialize MyFaces, instead the default javax |
| o.a.m.VALIDATE_XML | 2.0 |  | true, false, on, off, yes, no | If set to <code>true</code>, tag library XML files and faces config XML files using schema will be validated during application start up |
| o.a.m.DEBUG_PHASE_LISTENER | 2.0.8 |  |  | Enable/disable DebugPhaseListener feature, with provide useful information about ValueHolder  variables (submittedValue, localValue, value) |
| o.a.m.STRICT_JSF_2_REFRESH_TARGET_AJAX | 2.0.10 | false | true, false | Detect if a target (usually head) should be update for the current view in an ajax render  operation |
| o.a.m.GAE_JSF_JAR_FILES |  2.0.14 |  | none, myfavoritejsflib-*.jar | When the application runs inside Google Application Engine container (GAE), indicate which jar files should be scanned for files (faces-config, facelets taglib or annotations) |
| o.a.m.GAE_JSF_ANNOTATIONS_JAR_FILES | 2.0.14 |  | none, myfavoritejsflib-*.jar | When the application runs inside Google Application Engine container (GAE), indicate which jar files should be scanned for annotations |
| o.a.m.FLASH_SCOPE_DISABLED | 2.0.5 | false |  | Defines whether flash scope is disabled, preventing add the Flash cookie to the response |
| o.a.m.LAZY_LOAD_CONFIG_OBJECTS | 2.0 | true |  | Indicate if the classes associated to components, converters, validators or behaviors should be loaded as soon as they are added to the current application instance or instead loaded in a lazy way |
| o.a.m.VALIDATE | 2.0 | false | true, false | Validate if the managed beans and navigations rules are correct |
| o.a.m.annotation.SCAN_PACKAGES | 2.0 |  |  | Servlet context init parameter which defines which packages to scan for beans, separated by commas |
| o.a.m.config.annotation.LifecycleProvider | 1.1 |  |  | no description |
| o.a.m.ERROR_TEMPLATE_RESOURCE | 1.2.4 | META-INF/rsc/myfaces-dev-error.xml |  | Indicate the template name used to render the default error page used by MyFaces specific  error handler implementation |
| o.a.m.DEBUG_TEMPLATE_RESOURCE | 1.2.4 | META-INF/rsc/myfaces-dev-debug.xml |  | Indicate the template name used to render the default debug page (see ui:debug tag) |
| o.a.m.ERROR_HANDLING | 1.2.4 | false, on Development Project stage: true | true,false | Indicate if myfaces is responsible to handle errors |
| o.a.m.SERVICE_PROVIDER_FINDER | 2.0.3 |  |  | Class name of a custom ServiceProviderFinder implementation. |
| o.a.m.WRAP_TAG_EXCEPTIONS_AS_CONTEXT_AWARE | 2.0.9 | true | true, false | Wrap exception caused by calls to EL expressions, so information like the location, expression string and tag name can be retrieved by the ExceptionHandler implementation and used to output meaningful information about itself |
| o.a.m.VIEW_POOL_MAX_POOL_SIZE |  | 5 |  | Defines the number of views to be hold per each view metadata definition |
| o.a.m.VIEW_POOL_MAX_DYNAMIC_PARTIAL_LIMIT |  | 2 |  | Defines the limit of the views that cannot be reused partially |
| o.a.m.VIEW_POOL_ENTRY_MODE |  | soft | weak,soft | Defines the type of memory reference that is used to hold the view into memory |
| o.a.m.VIEW_POOL_DEFERRED_NAVIGATION |  | false | true, false | Defines if the view pool uses deferred navigation to recycle views when navigation is performed |
| o.a.m.INITIALIZE_ALWAYS_STANDALONE | 2.0.3 | false |  | If this param is set to true, the check for faces servlet mapping is not done |
| o.a.m.LOG_WEB_CONTEXT_PARAMS |  | auto | true, auto, false | Indicate if log all web config params should be done before initialize the webapp |
| o.a.m.FACES_INITIALIZER | 2.0.1 |  |  | Class name of a custom FacesInitializer implementation. |
| o.a.m.FACES_INIT_PLUGINS | 2.0 |  |  | comma delimited list of plugin classes which can be hooked into myfaces |

### Validation
| Name | Since | Default value | Expected values | Description |
| ---- | ---- | ---- | ---- | ---- |
| javax.faces.VALIDATE_EMPTY_FIELDS | 2.0 | auto | auto, true, false | Force validation on empty fields (By default is auto, which means it is only enabled when Bean Validation binaries are available on the current classpath) |
| javax.faces.INTERPRET_EMPTY_STRING_SUBMITTED_VALUES_AS_NULL | 2.0 | false | true, false | Submitted values are decoded as null values instead empty strings |
| javax.faces.DATETIMECONVERTER_DEFAULT_TIMEZONE_IS_SYSTEM_TIMEZONE | 2.0 | false | true, false | Set the default timezone as system timezone when a converter extending from DateTimeConverter is created |
| o.a.m.ENUM_CONVERTER_ALLOW_STRING_PASSTROUGH | 2.0.1 | false | true,false | If value is a String instance and this param is true, pass it directly without try any change |
| javax.faces.validator.DISABLE_DEFAULT_BEAN_VALIDATOR | 2.0 | true | true, false | If this init parameter is present, no Bean Validators should be added to an UIInput by default |

### EL
| Name | Since | Default value | Expected values | Description |
| ---- | ---- | ---- | ---- | ---- |
| o.a.m.CACHE_EL_EXPRESSIONS | 2.0.8 | noCache | noCache, strict, allowCset, always, alwaysRecompile | Indicates if expressions generated by facelets should be cached or not |
| o.a.m.EXPRESSION_FACTORY | 1.2.7 |  |  | This parameter specifies the ExpressionFactory implementation to use |
| o.a.m.EL_RESOLVER_COMPARATOR | 2.0.2 |  |  | The Class of an Comparator&lt;ELResolver&gt; implementation. |
| o.a.m.STRICT_JSF_2_CC_EL_RESOLVER | 2.0.10 | false | true, false | Change default getType() behavior for composite component EL resolver, from return null (see JSF 2_0 spec section 5_6_2_2) to use the metadata information added by composite:attribute, ensuring components working with chained EL expressions to find the right type when a getType() is called over the source EL expression |
| o.a.m.SUPPORT_JSP_AND_FACES_EL | 2.0.13 | true | true,false | If set false, myfaces won't support JSP and javax.faces.el. JSP are deprecated in JSF 2.X, javax.faces.el in in JSF 1.2. Default value is true. |

### Render
| Name | Since | Default value | Expected values | Description |
| ---- | ---- | ---- | ---- | ---- |
| o.a.m.WRAP_SCRIPT_CONTENT_WITH_XML_COMMENT_TAG | 2.0.1 | false | true, false, on, off, yes, no | Wrap content inside script with xml comment to prevent old browsers to display it |
| o.a.m.RENDER_FORM_SUBMIT_SCRIPT_INLINE | 2.0.2 | false | true, false, on, off, yes, no | If set true, render the form submit script inline, as in myfaces core 1 |
| o.a.m.DEFAULT_RESPONSE_WRITER_CONTENT_TYPE_MODE | 2.0.11 | text/html | text/html, application/xhtml+xml | Define the default content type that the default ResponseWriter generates, when no match can be derived from HTTP Accept Header |
| o.a.m.PRETTY_HTML | 1.1 | true | true, false, on, off, yes, no | If true, rendered HTML code will be formatted, so that it is "human readable" |
| o.a.m.ALLOW_JAVASCRIPT | 1.1 | true | true, false, on, off, yes, no | This parameter tells MyFaces if javascript code should be allowed in the rendered HTML output |
| o.a.m.STRICT_XHTML_LINKS | 1.1.6 | true | true, false, on, off, yes, no | Use "&amp;amp;" entity instead a plain "&amp;" character within HTML |
| o.a.m.RENDER_CLEAR_JAVASCRIPT_FOR_BUTTON | 1.2.3 | false | true, false, on, off, yes, no | This param renders the clear javascript on button necessary only for compatibility with hidden fields feature of myfaces |
| o.a.m.RENDER_HIDDEN_FIELDS_FOR_LINK_PARAMS | 1.2.9 | false | true, false, on, off, yes, no | This param renders hidden fields at the end of h:form for link params when h:commandLink + f:param is used, instead use javascript to create them |
| o.a.m.SAVE_FORM_SUBMIT_LINK_IE | 1.1 | false | true, false, on, off, yes, no | Add a code that save the form before submit using a link |
| o.a.m.USE_MULTIPLE_JS_FILES_FOR_JSF_UNCOMPRESSED_JS | 2.0.1 | false | true,false | If this param is true and the project stage is development mode, the source javascript files will be loaded separately instead have all in just one file, to preserve line numbers and make javascript debugging of the default jsf javascript file more simple |
| o.a.m.JSF_JS_MODE | 2.0.10 | normal | normal, minimal-modern, minimal | Define the mode used for jsf |

### ViewHandler
| Name | Since | Default value | Expected values | Description |
| ---- | ---- | ---- | ---- | ---- |
| javax.faces.DEFAULT_SUFFIX | 1.1 | .xhtml .view.xml .jsp |  | Indicate the default suffixes, separated by spaces to derive the default file URI  used by JSF to create views and render pages |
| javax.faces.FACELETS_SUFFIX | 2.0 | .xhtml |  | The default extension used to handle facelets pages |
| javax.faces.FACELETS_VIEW_MAPPINGS | 2.0 |  |  | Set of extensions handled by facelets, separated by ';' |
| javax.faces.DISABLE_FACELET_JSF_VIEWHANDLER | 2.0 | false | true,false | Disable facelets VDL from the current application project |
| o.a.m.VIEW_UNIQUE_IDS_CACHE_ENABLED | 2.0.13 | true | true, false | Enable or disable a cache used to 'remember'  the generated facelets unique ids and reduce the impact over memory usage. |
| o.a.m.COMPONENT_UNIQUE_IDS_CACHE_SIZE | 2.0.13 | 100 |  | Set the size of the cache used to store strings generated using SectionUniqueIdCounter for component ids |
| o.a.m.CHECKED_VIEWID_CACHE_SIZE | 2.0.2 | 500 |  | Controls the size of the cache used to 'remember' if a view exists or not. |
| o.a.m.CHECKED_VIEWID_CACHE_ENABLED | 2.0.2 | true | true, false | Enable or disable a cache used to 'remember' if a view exists or not and reduce the impact of sucesive calls to ExternalContext.getResource(). |

###  Resources
| Name | Since | Default value | Expected values | Description |
| ---- | ---- | ---- | ---- | ---- |
| javax.faces.RESOURCE_EXCLUDES | 2.0 | .class .jsp .jspx .properties .xhtml .groovy |  | Space separated file extensions that will not be served by the default ResourceHandler implementation |
| o.a.m.RESOURCE_MAX_TIME_EXPIRES | 2.0 | 604800000 |  | Set the max time in miliseconds set on the "Expires" header for a resource rendered by the default ResourceHandler |
| o.a.m.RESOURCE_HANDLER_CACHE_SIZE | 2.0.2 | 500 |  | Controls the size of the cache used to check if a resource exists or not |
| o.a.m.RESOURCE_HANDLER_CACHE_ENABLED | 2.0.2 | true | true,false | Enable or disable the cache used to "remember" if a resource handled by the default ResourceHandler exists or not |
| o.a.m.STRICT_JSF_2_ALLOW_SLASH_LIBRARY_NAME | 2.0.12 | false | true, false | Allow slash in the library name of a Resource |
| o.a.m.RESOURCE_BUFFER_SIZE | 2.0.16 | 2048 |  | Define the default buffer size that is used between Resource |


### State

| Name | Since | Default value | Expected values | Description |
| ---- | ---- | ---- | ---- | ---- |
| javax.faces.STATE_SAVING_METHOD | 1.1 | server | server,client | Define the state method to be used. There are two different options defined by the specification: 'client' and 'server' state. |
| javax.faces.FULL_STATE_SAVING_VIEW_IDS | 2.0 |  |  | Indicate the viewId(s) separated by commas that should be saved and restored fully, without use Partial State Saving (PSS) |
| javax.faces.PARTIAL_STATE_SAVING | 2.0 | true (false with 1.2 webapps) | true,false | Enable or disable partial state saving algorithm |
| o.a.m.USE_ENCRYPTION | 1.1 | true | true,false | Indicate if the view state is encrypted or not |
| o.a.m.SECRET | 1.1 |  |  | Defines the secret (Base64 encoded) used to initialize the secret key for encryption algorithm |
| o.a.m.ALGORITHM | 1.1 | DES |  | Indicate the encryption algorithm used for encrypt the view state |
| o.a.m.SECRET.CACHE | 1.1 |  |  | If is set to "false", the secret key used for encryption algorithm is not cached |
| o.a.m.ALGORITHM.IV | 1.1 |  |  | Defines the initialization vector (Base64 encoded) used for the encryption algorithm |
| o.a.m.ALGORITHM.PARAMETERS | 1.1 | ECB/PKCS5Padding |  | Defines the default mode and padding used for the encryption algorithm |
| o.a.m.SERIAL_FACTORY | 1.1 |  |  | Defines the factory class name using for serialize/deserialize the view state returned by state manager into a byte array |
| o.a.m.COMPRESS_STATE_IN_CLIENT | 1.1 | false | true,false | Indicate if the view state should be compressed before encrypted(optional) and encoded |
| o.a.m.MAC_ALGORITHM |  | HmacSHA1 |  | Indicate the algorithm used to calculate the Message Authentication Code that is added to the view state |
| o.a.m.MAC_SECRET |  |  |  | Define the initialization code that are used to initialize the secret key used on the Message Authentication Code algorithm |
| o.a.m.MAC_SECRET.CACHE |  |  |  | If is set to "false", the secret key used for MAC algorithm is not cached |
| o.a.m.CLIENT_VIEW_STATE_TIMEOUT | 2.0.15 | 0 |  | Define the time in minutes where the view state is valid when client side state saving is used |
| o.a.m.SERIALIZE_STATE_IN_SESSION | 1.1 | false | true,false | Indicate if the state should be serialized before save it on the session |
| o.a.m.COMPRESS_STATE_IN_SESSION | 1.1 | true | true,false | Indicates that the serialized state will be compressed before it is written to the session |
| o.a.m.CACHE_OLD_VIEWS_IN_SESSION_MODE | 1.2.5 | off | off, no, hard-soft, soft, soft-weak, weak | Define the way of handle old view references(views removed from session), making possible to store it in a cache, so the state  |  |
| o.a.m.USE_FLASH_SCOPE_PURGE_VIEWS_IN_SESSION | 2.0.6 | false | true, false | Allow use flash scope to keep track of the views used in session and the previous ones, so server side state saving can delete old views even if POST-REDIRECT-GET pattern is used |
| o.a.m.RANDOM_KEY_IN_VIEW_STATE_SESSION_TOKEN | 2.0.15 | secureRandom | secureRandom, random | Adds a random key to the generated view state session token. As of version 2.0.25 the default switched from `random` to `secureRandom`. |
| o.a.m.RANDOM_KEY_IN_VIEW_STATE_SESSION_TOKEN_LENGTH | 2.0.15 | 8 |  | Set the default length of the random key added to the view state session token |
| o.a.m.RANDOM_KEY_IN_VIEW_STATE_SESSION_TOKEN_SECURE_RANDOM_CLASS | 2.0.15 |  |  | Sets the random class to initialize the secure random id generator |
| o.a.m.RANDOM_KEY_IN_VIEW_STATE_SESSION_TOKEN_SECURE_RANDOM_PROVIDER | 2.0.15 |  |  | Sets the random provider to initialize the secure random id generator |
| o.a.m.RANDOM_KEY_IN_VIEW_STATE_SESSION_TOKEN_SECURE_RANDOM_ALGORITM | 2.0.15 | SHA1PRNG |  | Sets the random algorithm to initialize the secure random id generator |
| o.a.m.SAVE_STATE_WITH_VISIT_TREE_ON_PSS | 2.0.8 | true | true, false | If this param is set to true (by default), when pss algorithm is executed to save state, a visit tree traversal is done, instead a plain traversal like previous versions |
| o.a.m.CHECK_ID_PRODUCTION_MODE | 2.0.12 | auto | true, auto, false | Define how duplicate ids are checked when ProjectStage is Production, by default (auto) it only check ids of components that does not encapsulate markup (like facelets UILeaf) |
| o.a.m.REFRESH_TRANSIENT_BUILD_ON_PSS | 2.0 | auto | true,false,auto | Indicate if the facelet associated to the view should be reapplied when the view is refreshed |
| o.a.m.REFRESH_TRANSIENT_BUILD_ON_PSS_PRESERVE_STATE | 2.0 | false | true, false, on, off, yes, no | Enable or disable a special mode that enable full state for parent components containing c:if, c:forEach,  c:choose and ui:include with src=ELExpression |
| o.a.m.RENDER_VIEWSTATE_ID | 1.1 | true | true, false, on, off, yes, no | Define if the input field that should store the state (javax.faces.ViewState) should render id="javax.faces.ViewState". |
| o.a.m.NUMBER_OF_VIEWS_IN_SESSION | 1.1 | 20 |  | Defines the amount (default = 20) of the latest views are stored in session |
| o.a.m.NUMBER_OF_SEQUENTIAL_VIEWS_IN_SESSION | 2.0.6 | 4 |  | Indicates the amount of views (default is not active) that should be stored in session between sequential POST or POST-REDIRECT-GET if org |
| o.a.m.AUTOCOMPLETE_OFF_VIEW_STATE | 2.0.24 | true | true, false | Add autocomplete="off" to the view state hidden field |

### Deprecated
| Name | Since | Default value | Expected values | Description |
| ---- | ---- | ---- | ---- | ---- |
| facelets.BUFFER_SIZE | 2.0 |  |  | Define the default buffer size value passed to ExternalContext |
| facelets.REFRESH_PERIOD | 2.0 | -1 |  | Define the period used to refresh the facelet abstract syntax tree from the view definition file |
| facelets.RESOURCE_RESOLVER | 2.0 |  |  | Class implementing ResourceResolver interface used to locate facelet resources |
| facelets.DECORATORS | 2.0 |  |  | Set of class names, separated by ';', implementing TagDecorator interface, used to transform a view definition in a facelet abstract syntax tree, that is used later to generate a component tree |
| facelets.SKIP_COMMENTS | 2.0 |  |  | Skip comments found on a facelet file |
| facelets.LIBRARIES | 2.0 |  |  | Set of .taglib.xml files, separated by ';' that should be loaded by facelet engine. |
| o.a.m.ERROR_HANDLER | 1.2.4 |  |  | Deprecated: use JSF 2.0 ExceptionHandler |
| o.a.m.VIEWSTATE_JAVASCRIPT | 1.1 | false | true, false, on, off, yes, no | Set the view state using a javascript function instead a hidden input field |


## Integration / SPI

> :warning: **usually common users of MyFaces Core does not need to deal with these specific stuff, because the application/web server could already provide the necessary hooks or integration modules "out of the box"**

MyFaces core provides some "points of integration" that can be used by application and web servers to override or add some specific code.
For example, JBoss AS provides a custom virtual file system (VFS), and MyFaces core needs to scan for faces-config.xml files, so it is necessary to provide some code that uses JBoss VFS to locate faces-config.xml files to be parsed later.

Some features uses Service Provider Interface (SPI) pattern, so take a look at java.util.ServiceLoader description in java 6 api to get the idea how it works.

Below there is a table of the "points of integration" used by application and web servers:

| Integration Point                                                          | Classes Involved                                                   | Description                                                                                                                                                                                                                                                                                                                                                       | Since                |
|----------------------------------------------------------------------------|--------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------|
| @PostConstruct and @PreDestroy injection over jsf managed beans            | org.apache.myfaces.config.annotation.LifecycleProvider2   org.apache.myfaces.config.annotation.LifecycleProviderFactory            | Provide methods to delegate injection of @PostConstruct and @PreDestroy annotations to the server for custom processing.                                                                                                                                                                          | 1.2.7           |
| Override SPI handling                                                      | org.apache.myfaces.spi.ServiceProviderFinder  <br/> org.apache.myfaces.spi.ServiceProviderFinderFactory  | Override SPI handling done by MyFaces Core, usually taking advantage of container specific features to scan files inside jars.                                                                                                                                                                                                                                    | 2.0.3, 2.1.0         |
| Annotation Scanning                                                        | org.apache.myfaces.spi.AnnotationProvider <br/> org.apache.myfaces.spi.AnnotationProviderWrapper <br/> org.apache.myfaces.spi.AnnotationProviderFactory | Override/wrap myfaces annotation scanning algorithm that needs to be processed at startup.                                                                                                                                                                                                                                                                        | 2.0.3, 2.1.0         |
| Locate facelet .taglib.xml files through classpath.                        | org.apache.myfaces.spi.FaceletConfigResourceProvider <br/> org.apache.myfaces.spi.FaceletConfigResourceProviderFactory             | Locate facelet .taglib.xml files through classpath. These files has definitions that are used by facelets algorithm to parse view files.                                                                                                                                                                                                                          | 2.0.3, 2.1.0         |
| Locate faces-config.xml files through classpath.                           | org.apache.myfaces.spi.FacesConfigResourceProvider <br/>  org.apache.myfaces.spi.FacesConfigResourceProviderFactory               | Locate faces-config xml files through classpath. These files has definitions that are used by initialize jsf environment. By default it locate all files inside META-INF folder, named faces-config.xml or ending with .faces-config.xml                                                                                                                          | 2.0.3, 2.1.0         |
| Get an unified configuration after sort and order all config files.        | org.apache.myfaces.spi.FacesConfigurationMerger <br/> org.apache.myfaces.spi.FacesConfigurationMergerFactory <br/> org.apache.myfaces.config.element.*   | Get all org.apache.myfaces.config.element.FacesConfig data  and then it combines it into one org.apache.myfaces.config.element.FacesConfigData instance.                                                                                                                                                                                                          | 2.0.3, 2.1.0         |
| Get configuration information from different sources and allow cache them. | org.apache.myfaces.spi.FacesConfigurationProvider <br/> org.apache.myfaces.spi.FacesConfigurationProviderFactory <br/> org.apache.myfaces.config.element.*                 | This interface provide a way to merge and store all JSF config information retrieved from faces-config.xml files, META-INF/service files and annotations that works as base point to initialize MyFaces. The objective is allow server containers to "store" or this information, preventing calculate it over and over each time the web application is started. | 2.0.3, 2.1.0         |
| Override javax.faces.FactoryFinder default algorithm                       | org.apache.myfaces.spi.FactoryFinderProvider <br/> org.apache.myfaces.spi.FactoryFinderProviderFactory                  | Provide an interface to override javax.faces.FactoryFinder class methods. This is useful if containers does not want to use Thread Context Class Loader to load classes, like in OSGi.                                                                                                                                                                            | 2.0.5, 2.1.0         |
| Provide additional info from web.xml files                                 | org.apache.myfaces.spi.WebConfigProvider <br/>  org.apache.myfaces.spi.WebConfigProviderFactory   org.apache.myfaces.spi.ServletMapping                     | Provide additional info from web.xml files, like mapping or if an error page is present.                                                                                                                                                                                                                                                                          | 2.0.3, 2.1.0         |
| Override initialization and destroy web applications                       | org.apache.myfaces.webapp.FacesInitializer <br/> org.apache.myfaces.webapp.FacesInitializerFactory                      | Allow customize initialization / destroy operations or provide an alternate MyFaces initializer to a specific container.                                                                                                                                                                                                                                          | 2.0.1, 2.1.0               |


