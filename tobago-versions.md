# Which version?

Tobago was compatible with the following specifications, libraries and containers.
This list is not exhaustive, additions are welcome.

<table>
    <tbody>
    <tr>
      <th>Tobago Version</th>
      <th>1.0.x [archived]</th>
      <th>1.5.x [archived]</th>
      <th>2.x</th>
      <th>3.x [archived]</th>
      <th>4.x</th>
      <th>5.x</th>
      <th>6.x [in development]</th>
    </tr>
    <tr>
      <th colspan="8">Specifications</th>
    </tr>
    <tr>
      <td>Java</td>
      <td>1.4 [retro], <b>1.5</b>, 1.6, 1.7</td>
      <td>1.5, 1.6, 1.7, 1.8</td>
      <td> 1.5, 1.6, 1.7, 1.8, 9, 11, 17
        (since Tobago 2.5 Java 1.7 or higher is required)</td>
      <td>1.8, 9, 10</td>
      <td>8, 11, 17 (others should work)</td>
      <td>8, 11, 17 (others should work)</td>
      <td>11, 17 (others should work)</td>
    </tr>
    <tr>
      <td>JSF</td>
      <td><b>1.1</b>, 1.2</td>
      <td>1.2, 2.0 [disable vh], 2.1 [disable vh]</td>
      <td>2.0, 2.1, 2.2, 2.3</td>
      <td>2.0, 2.1, 2.2</td>
      <td>2.0, 2.1, 2.2, 2.3</td>
      <td>2.3</td>
      <td>3.0</td>
    </tr>
    <tr>
      <td>Facelets</td>
      <td><b>1.1</b> [ext]</td>
      <td><b>1.1</b> [ext]</td>
      <td> [int]</td>
      <td> [int]</td>
      <td> [int]</td>
      <td> [int]</td>
      <td> [int]</td>
    </tr>
    <tr>
      <td>Servlet</td>
      <td> 2.3, <b>2.4</b>, 2.5</td>
      <td>2.4 [facelets only], <b>2.5</b>, 3.0</td>
      <td>2.4 [facelets only], <b>2.5</b>, <b>3.0</b>, <b>3.1</b>, 4.0
      (since Tobago 2.4 version 3.0 or higher is required)</td>
      <td>3.0, 3.1</td>
      <td>3.0, 3.1, 4.0</td>
      <td>4.0</td>
      <td>5.0</td>
    </tr>
    <tr>
      <td>JSP</td>
      <td>1.2, <b>2.0</b>, 2.1</td>
      <td><b>2.1</b>, 2.2</td>
      <td>2.1, 2.2</td>
      <td>-</td>
      <td>-</td>
      <td>-</td>
      <td>-</td>
    </tr>
    <tr>
      <th colspan="8">Implementations</th>
    </tr>
    <tr>
      <td>MyFaces</td>
      <td>yes</td>
      <td>yes</td>
      <td>yes</td>
      <td>yes</td>
      <td>yes</td>
      <td>yes</td>
      <td>yes</td>
    </tr>
    <tr>
      <td>Mojarra</td>
      <td>yes</td>
      <td>yes</td>
      <td>yes</td>
      <td>2.1 and higher</td>
      <td>2.1 and higher</td>
      <td>yes</td>
      <td>yes</td>
    </tr>
    <tr>
      <th colspan="8">Servers</th>
    </tr>
    <tr>
      <td>Tomcat</td>
      <td>4.1, 5.0, 5.5, 6, 7</td>
      <td> 5.5 [facelets only], 6, 7</td>
      <td>5.5 [facelets only], 6, 7</td>
      <td>7, 8</td>
      <td>7, 8, 9</td>
      <td>9</td>
      <td>10</td>
    </tr>
    <tr>
      <td>Jetty</td>
      <td>6, 7</td>
      <td>6, 7, 8</td>
      <td>6, 7, 8</td>
      <td>8, 9</td>
      <td>8, 9</td>
      <td>9.3, 10</td>
      <td>11</td>
    </tr>
    <tr>
      <td>WebLogic</td>
      <td> 8.1, 9.0, 9.1, 9.2, 10, 11g</td>
      <td>9.2 [facelets only], 10, 11g, 12c</td>
      <td>9.2 [facelets only], 10, 11g, 12c</td>
      <td>12c</td>
      <td>12c</td>
      <td>?</td>
      <td>?</td>
    </tr>
    <tr>
      <td>WebSphere</td>
      <td>6.0, 6.1</td>
      <td> 6.1 [facelets only], 7, 8, 8.5</td>
      <td>6.1 [facelets only], 7, 8, 8.5</td>
      <td>8, 8.5, 9</td>
      <td>8, 8.5, 9</td>
      <td>?</td>
      <td>?</td>
    </tr>
    <tr>
      <td>Quarkus</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td>?</td>
      <td>?</td>
    </tr>
    <tr>
      <td>Other</td>
      <td> [other servers]</td>
      <td> [other servers]</td>
      <td> [other servers]</td>
      <td> [other servers]</td>
      <td> [other servers]</td>
      <td> [other servers]</td>
      <td> [other servers]</td>
    </tr>
    <tr>
      <th colspan="6">Browser</th>
    </tr>
    <tr>
      <td>Internet Explorer / Edge</td>
      <td>6, 7, 8, 9, 10, 11</td>
      <td>6, 7, 8, 9, 10, 11, ...</td>
      <td>6 [lim], 
7 [lim], 
8 [lim], 9, 10, 11, ...</td>
      <td>10 [lim], 11, ...</td>
      <td>10 [lim], 11, ...</td>
      <td> [latest]</td>
      <td> [latest]</td>
    </tr>
    <tr>
      <td>Firefox</td>
      <td>2, 3, 4, ...</td>
      <td>2, 3, 4, ...</td>
      <td>2 [lim], 3, 4, ...</td>
      <td> [latest]</td>
      <td> [latest]</td>
      <td> [latest]</td>
      <td> [latest]</td>
    </tr>
    <tr>
      <td>Safari</td>
      <td>-</td>
      <td>4, 5, 6, ...</td>
      <td>4, 5, 6, ...</td>
      <td> [latest]</td>
      <td> [latest]</td>
      <td> [latest]</td>
      <td> [latest]</td>
    </tr>
    <tr>
      <td>Chrome</td>
      <td>-</td>
      <td>5, ...</td>
      <td>5, ...</td>
      <td> [latest]</td>
      <td> [latest]</td>
      <td> [latest]</td>
      <td> [latest]</td>
    </tr>
    <tr>
      <td>Opera</td>
      <td>-</td>
      <td>10, 11</td>
      <td>10, 11, ...</td>
      <td> [latest]</td>
      <td> [latest]</td>
      <td> [latest]</td>
      <td> [latest]</td>
    </tr>
    <tr>
      <td> [other browsers]</td>
      <td> [other browsers]</td>
      <td> [other browsers]</td>
      <td> [other browsers]</td>
      <td> [other browsers]</td>
      <td> [other browsers]</td>
      <td>with ES6 support</td>
      <td>with ES6 support</td>
    </tr>
    <tr>
      <th colspan="6">Frameworks</th>
    </tr>
    <tr>
      <td>CDI</td>
      <td></td>
      <td>yes</td>
      <td>yes</td>
      <td>yes</td>
      <td>yes</td>
      <td>yes</td>
      <td>yes</td>
    </tr>
    <tr>
      <td>Codi</td>
      <td></td>
      <td>yes</td>
      <td>yes</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>DeltaSpike</td>
      <td></td>
      <td>yes</td>
      <td>yes</td>
      <td>yes</td>
      <td>yes</td>
      <td>n/a</td>
      <td>n/a</td>
    </tr>
    <tr>
      <td>JSR-303 / BV</td>
      <td></td>
      <td>yes</td>
      <td>yes</td>
      <td>yes</td>
      <td>yes</td>
      <td>yes</td>
      <td>yes</td>
    </tr>
    </tbody>
  </table>

  <!-- JSF Addon-Frameworks: Apache Shale Dialog, Apache Shale Clay, Spring Web Flow, Seam, WebBeans, "Validator", ...-->
  <!-- IoC Frameworks: Spring, Guice, ...-->
  <!-- Component Libs: Richfaces, Icefaces, Trinidad, Tomahawk ...-->

<b>bold font</b>:
preferred

normal font:
compatible

[archived]:
this version of Tobago is archived and not under active development

[retro]:
use the JDK 1.4 retro version (available for Tobago 1.0.41 and before)

[ext]:
add the tobago-facelets extension

[int]:
since Tobago 2.0 and JSF 2.0 Facelets are integrated in JSF

[tbd]:
to be defined (this information is unsettled and may change)

[lim]:
these old browsers are generally supported, but may have weak appearance

[facelets only]:
it works with facelets, but not with JSP, because JSF 1.2 requires JSP 2.1

[other servers]:
other servers should work, when they are compliant to the named specifications

[latest]:
all browser supported by Bootstrap 4 are supported, these are usually the latest, stable releases

[other browsers]:
other browsers should work, in their actual version, when they are standard compliant to HTML 4 and CSS 2.1

[no release]:
Using Tobago 1.5 with JSF 1.1 is currently not part of the release, but can be build from the sources with mvn -Pjsf-1.1

[disable vh]:
Tobago 1.5 works with JSF 2.0 when you are disable the Facelets ViewHandler from JSF 2.0 and using the
  original Facelets:
```
<context-param>
    <description>For backward compatibility (using "old" Facelets with JSF 2.0)</description>
    <param-name>javax.faces.DISABLE_FACELET_JSF_VIEWHANDLER</param-name>
    <param-value>true</param-value>
</context-param>
```
