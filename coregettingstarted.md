# Apache MyFaces Core - Getting Started

## Build
Checkout from [Apache GitBox](https://gitbox.apache.org/repos/asf?p=myfaces.git) or [GitHub](https://github.com/apache/myfaces) and run `mvn clean install`

## Useful links
* Builds: [Jenkins](https://ci-builds.apache.org/job/MyFaces/), [GitHub Actions](https://github.com/apache/myfaces/actions)
* Issue Management: [JIRA](https://issues.apache.org/jira/projects/MYFACES/) 
* Javadocs: [javadoc.io](https://javadoc.io/doc/org.apache.myfaces.core/myfaces-api/latest/index.html)
* Wiki: [Wiki](https://cwiki.apache.org/confluence/display/MYFACES/Index)

## Usage

Apache MyFaces Core can be deployed to any Servlet Container (like Tomcat, Jetty) inside the WAR or inside the container (/tomcat/lib).  
If you want to deploy it, instead of Mojarra, inside a Application Server like Glassfish or JBoss, please check the documentation of the Application Server.  

We also have a Quarkus extensions since 2.3-next.  


### Dependency
```xml
<dependency>
    <groupId>org.apache.myfaces.core</groupId>
    <artifactId>myfaces-api</artifactId>
    <version>2.3-next-M3</version>
</dependency>
<dependency>
    <groupId>org.apache.myfaces.core</groupId>
    <artifactId>myfaces-impl</artifactId>
    <version>2.3-next-M3</version>
</dependency>
```

### web.xml
```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd"
         version="3.1">

    <servlet>
        <servlet-name>Faces Servlet</servlet-name>
        <servlet-class>javax.faces.webapp.FacesServlet</servlet-class>
    </servlet>
    <servlet-mapping>
        <servlet-name>Faces Servlet</servlet-name>
        <url-pattern>*.xhtml</url-pattern>
    </servlet-mapping>

</web-app>
```

### index.xhtml
```xml
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
  xmlns:f="http://xmlns.jcp.org/jsf/core"
  xmlns:h="http://xmlns.jcp.org/jsf/html">

  <h:head>

  </h:head>

  <h:body>

    Hello World!

  </h:body>
</html>
```

## Quarkus

Since 2.3-next a Quarkus extension is available: 

```xml
<dependency>
	<groupId>org.apache.myfaces.core.extensions.quarkus</groupId>
	<artifactId>myfaces-quarkus</artifactId>
	<version>${myfaces.version}</version>
</dependency>
```

The easiest way to getting started is to clone our sample project, which can be found here: https://github.com/apache/myfaces/blob/master/extensions/quarkus/showcase/

Uber-JARs are not supported by design currently.  
  
  
What are the differences when develope a JSF app on Quarkus compared to a normal servlet container?
* You need to put your views under `src/main/resources/META-INF/resources` as Quarkus doesn't create a WAR and `src/main/webapp` is ignored!
* Session replication / passivation / clustering is not supported yet by Quarkus
* `@ConversationScoped` is not supported by Quarkus

