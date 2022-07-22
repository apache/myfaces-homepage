# Apache MyFaces Core 1.1

Implementation of the JavaServer™ Faces (JSF) 1.1 specification.

## Source
[Apache GitBox](https://gitbox.apache.org/repos/asf?p=myfaces.git;a=shortlog;h=refs/heads/1.1.x) / [GitHub](https://github.com/apache/myfaces/tree/1.1.x)

## Downloads

|     | Mirrors                                                                                                                      | Checksum                                                                                                                     | Signature                                                                                                                                |
|-----------------|------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------|
| binary (tar.gz) | [myfaces-core-assembly-1.1.10-bin.tar.gz](https://www.apache.org/dyn/closer.lua/myfaces/binaries/myfaces-core-assembly-1.1.10-bin.tar.gz) | [myfaces-core-assembly-1.1.10-bin.tar.gz.md5](https://downloads.apache.org/myfaces/binaries/myfaces-core-assembly-1.1.10-bin.tar.gz.md5) | [myfaces-core-assembly-1.1.10-bin.tar.gz.asc](https://downloads.apache.org/myfaces/binaries/myfaces-core-assembly-1.1.10-bin.tar.gz.asc) |
| binary (zip)    | [myfaces-core-assembly-1.1.10-bin.zip](https://www.apache.org/dyn/closer.lua/myfaces/binaries/myfaces-core-assembly-1.1.10-bin.zip)       | [myfaces-core-assembly-1.1.10-bin.zip.md5](https://downloads.apache.org/myfaces/binaries/myfaces-core-assembly-1.1.10-bin.zip.md5)       | [myfaces-core-assembly-1.1.10-bin.zip.asc](https://downloads.apache.org/myfaces/binaries/myfaces-core-assembly-1.1.10-bin.zip.asc)       |
| source (tar.gz) | [myfaces-core-assembly-1.1.10-src.tar.gz](https://www.apache.org/dyn/closer.lua/myfaces/source/myfaces-core-assembly-1.1.10-src.tar.gz)   | [myfaces-core-assembly-1.1.10-src.tar.gz.md5](https://downloads.apache.org/myfaces/source/myfaces-core-assembly-1.1.10-src.tar.gz.md5)   | [myfaces-core-assembly-1.1.10-src.tar.gz.asc](https://downloads.apache.org/myfaces/source/myfaces-core-assembly-1.1.10-src.tar.gz.asc)   |
| source (zip)    | [myfaces-core-assembly-1.1.10-src.zip](https://www.apache.org/dyn/closer.lua/myfaces/source/myfaces-core-assembly-1.1.10-src.zip)         | [myfaces-core-assembly-1.1.10-src.zip.md5](https://downloads.apache.org/myfaces/source/myfaces-core-assembly-1.1.10-src.zip.md5)         | [myfaces-core-assembly-1.1.10-src.zip.asc](https://downloads.apache.org/myfaces/source/myfaces-core-assembly-1.1.10-src.zip.asc)         |

## Release Verification
Steps for checksum & signature verification can be found [here](/releaseVerification.md)

## Dependency
```xml
<dependency>
  <groupId>org.apache.myfaces.core</groupId>
  <artifactId>myfaces-api</artifactId>
  <version>1.1.10</version>
</dependency>
<dependency>
  <groupId>org.apache.myfaces.core</groupId>
  <artifactId>myfaces-impl</artifactId>
  <version>1.1.10</version>
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

| Name | Since | Default value | Description |
| ---- | ---- | ---- | ---- | 
| o.a.m.USE_ENCRYPTION | 1.1.8 | | Indicate if the view state is encrypted or not |
| o.a.m.SECRET | 1.1 | |  Defines the secret (Base64 encoded) used to initialize the secret key for encryption algorithm|
| o.a.m.ALGORITHM | 1.1 | | Indicate the encryption algorithm used for encrypt the view state |
| o.a.m.SECRET.CACHE | 1.1 | | If is set to "false", the secret key used for encryption algorithm is not cached |
| o.a.m.ALGORITHM.IV | 1.1 | | Defines the initialization vector (Base64 encoded) used for the encryption algorithm |
| o.a.m.ALGORITHM.PARAMETERS | 1.1 | | Defines the default mode and padding used for the encryption algorithm |
| o.a.m.SERIAL_FACTORY | 1.1 | | Defines the factory class name using for serialize/deserialize the view state returned by state manager into a byte array |
| o.a.m.COMPRESS_STATE_IN_CLIENT | 1.1 | | Indicate if the view state should be compressed before encrypted(optional) and encoded |
| o.a.m.MAC_ALGORITHM | | | Indicate the algorithm used to calculate the Message Authentication Code that is added to the view state |
| o.a.m.MAC_SECRET | | | Define the initialization code that are used to initialize the secret key used on the Message Authentication Code algorithm |
| o.a.m.MAC_SECRET.CACHE | | | If is set to "false", the secret key used for MAC algorithm is not cached |

