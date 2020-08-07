# Apache MyFaces Core Release Checklist

Checklist of tasks to perform for each release. For general information about Apache releases you may also consult [Publishing Maven Artifacts](http://www.apache.org/dev/publishing-maven-artifacts.html).

## Setup

> :warning: **Make sure you have the right ssh public key set in id.apache.org page before performing the release steps.**

Before performing the release you need to configure your environment if you haven't done it before.
* Go to: Publishing Maven Artifacts
* Go to the section SETUP YOUR DEVELOPMENT ENVIRONMENT and generate the pgp key signature. Don't forget to distribute the public key step. [Generate PGP signature](https://blog.sonatype.com/2010/01/how-to-generate-pgp-signatures-with-maven/#.Vm9Km8q22-q).

**NOTE**: You can ignore sections GETTING YOUR PROJECT SETUP IN THE NEXUS REPOSITORY and MAVEN SPECIFIC PREPARATIONS AND PROCEDURES but reading the whole document will help you understand the release process. Also, we don't need to setup the project in nexus repository by creating a JIRA issue.

Some useful links/resources:
* [Apache Maven](http://central.sonatype.org/pages/apache-maven.html)
* [Guide Central Repository Upload](https://maven.apache.org/guides/mini/guide-central-repository-upload.html)
* [How to Publish a Java Library to Maven Central](https://youtube.com/watch?v=bxP9IuJbcDQ)

## 1. Prepare 

#### 1.1 Run

Once the environment is configured, you need to checkout the MyFaces development branch on [GitHub](https://github.com/apache/myfaces) and run the following commands to prepare the MyFaces Core release:

```
mvn clean install
mvn install -Pgenerate-assembly -Papache-release -Dgpg.passphrase=yourphrase
# The dryRun=true don't checkin or tag anything in the scm repository, or modify the checkout. 
# Useful to check modifications to poms and scm operations.
mvn release:prepare -DprepareRelease=true -DdryRun=true
# Run again this command to prepare release 
# and commit to https://github.com/apache/myfaces/tags repository.
mvn release:prepare -DprepareRelease=true -Dresume=false 
```

**NOTE**: Preparing the release will create the new tag in SVN, automatically checking in on your behalf.

**NOTE**: If you're located in Europe then release:prepare may fail with 'Unable to tag SCM' and 'svn: No such revision X'. Wait 10 seconds and run mvn release:prepare again.

**NOTE**: If you see a message like "You don't have a SNAPSHOT project in the reactor projects list" it means that the workspace directory is not cleaned and Maven uses the old temporary files which contain some weird versions instead of the current SNAPSHOTs. You will have to do a mvn release:clean or start the process again from the beginning. Maven no snapshot in the project

**NOTE**: If you have an issue like the one below when running the command "mvn release:prepare -DprepareRelease=true" that's because the local directory .m2/repository/org/apache/myfaces/core does not have the assembly files for the version to be released.

```
[INFO] [ERROR] Failed to execute goal org.codehaus.mojo:dependency-maven-plugin:1.0:copy (copy-javadoc) on 
project myfaces-core-assembly: Unable to find artifact. Could not find artifact 
org.apache.myfaces.core:myfaces-api:jar:javadoc:x.x.x in tomcat (http://tomcat.apache.org/dev/dist/m2-repository)
                    
```

To fix the issue, run again the following command to generate the assembly files for the version to be released

```
mvn install -Pgenerate-assembly -Papache-release -Dgpg.passphrase=yourphrase
```


Finally, execute again the release prepare command: "mvn release:prepare -DprepareRelease=true -Dresume=false" 

#### 1.2 Verify

Verify that the new tag myfaces-core-module-x.x.x was created: MyFaces Core Tags

You should be able to checkout myfaces-core-module-x.x.x and run: mvn install


#### 1.3 Stage 

Stage the release for a vote

```
# Finally perform the release so artifacts are uploaded to nexus repository.
mvn release:perform -DperformRelease=true
```

**NOTE**: This command is run from the local MyFaces 2.3.x development branch.

**NOTE**: You should be able to verify that the release is now available in the Nexus Repository. For more information check step 5 of this checklist.


Some useful links/resources:
* [Maven Prepare Release](http://maven.apache.org/maven-release/maven-release-plugin/examples/prepare-release.html)
* [Guide Releasing](https://maven.apache.org/guides/mini/guide-releasing.html)


## 2. JIRA Release Management

* Create the new version
* Find resolved issues and close them
* Move unresolved issues moved to new version
* Don't forget to change to "released" the version you are trying to release in the JIRA dashboard

Go to the following link perform these steps under the MyFaces Core Project: [JIRA Dashboard](https://issues.apache.org/jira/secure/Dashboard.jspa)

## 3. TKC

Run the TKC if available


## 4. Generate assembly

Assemblies are generated automatically by maven on release:perform step and should be available in the nexus maven repository to do the final deploy.

#### 4.1 Verify
Login to nexus repository using the id.apache.org account: [Nexus Repository](https://repository.apache.org/)
Go to "Build Promotion" / "Staging Repositories" and look for orgapachemyfaces-xxxx repository. Click "close" so the artifacts can be downloaded.

**NOTE**: If the artifacts have some bug when testing them you can click "drop"; if the artifacts are approved, follow the Step 8 in this wiki, so you can release them.

More information here: Locate and examine your staging repository

Example link: https://repository.apache.org/content/repositories/orgapachemyfaces-1130/org/apache/myfaces/core/myfaces-core-assembly/2.3.0/

**NOTE**: Providing MD5 or SHA1 checksum files is now discouraged for new releases, but still allowed for past releases.

#### 4.2 Generate manually

Otherwise you can generate them manually. Try to do it automatically javadoc and other stuff SUCCESS. It generate myfaces-core-2.3.0-bin.tar.gz and zip

```
mvn install -Pgenerate-assembly
cd assembly
mvn package
```

Create myfaces-core-2.3.0-src.tar.gz and zip manually and create .asc .sha1 for bin and src

```
openssl sha1 myfaces-core-2.3.0-src.tar.gz > myfaces-core-2.3.0-src.tar.gz.sha1
openssl sha1 myfaces-core-2.3.0-src.zip > myfaces-core-2.3.0-src.zip.sha1
gpg --armor --output myfaces-core-2.3.0-src.tar.gz.asc --detach-sig myfaces-core-2.3.0-src.tar.gz
gpg --armor --output myfaces-core-2.3.0-src.zip.asc --detach-sig myfaces-core-2.3.0-src.zip

openssl sha1 myfaces-core-2.3.0-bin.tar.gz > myfaces-core-2.3.0-bin.tar.gz.sha1
openssl sha1 myfaces-core-2.3.0-bin.zip > myfaces-core-2.3.0-bin.zip.sha1
gpg --armor --output myfaces-core-2.3.0-bin.tar.gz.asc --detach-sig myfaces-core-2.3.0-bin.tar.gz
gpg --armor --output myfaces-core-2.3.0-bin.zip.asc --detach-sig myfaces-core-2.3.0-bin.zip
```

Copy to ftp private account on people.apache.org

```
scp -p -r myfaces-core-2.3.0-bin* embreijo@people.apache.org:/home/embreijo/public_html/myfaces230binsrc/binaries
scp -p -r myfaces-core-2.3.0-src* embreijo@people.apache.org:/home/embreijo/public_html/myfaces230binsrc/sources
```

## 5. Check binary incompatibilities success

> :warning: **This step can be skipped on 2.3-next as the API JAR now contains `org.apache.myfaces` packages.**

In the past Clirr was used but it doesnt work anymore. We use a similar tool called japicmp now:  
Github: https://github.com/siom79/japicmp  
Website: https://siom79.github.io/japicmp/  

Comparison should be done between MyFaces 2.3 API and Mojarra 2.3 API jars, that is, myfaces-api-2.3.x.jar and javax.faces-api-2.3.jar.

* Download the jar-with-dependencies.jar archive and follow instructions to compare the two versions.
* Download the Mojarra API via https://mvnrepository.com/artifact/javax.faces/javax.faces-api/2.3
* Run it: java -jar japicmp-0.11.0-jar-with-dependencies.jar -n myfaces-api-2.3.x.jar -o javax.faces-api-2.3.jar --ignore-missing-classes --html-file <dir_name>/results.html

## 6. Start vote

Send a mail to

```
dev@myfaces.apache.org
```

with subject

```
Subject: [VOTE] release of MyFaces Core 2.3.0
```

and content

```
Hi,

I was running the needed tasks to get the 2.3.0 release of Apache
MyFaces core out.


Please note that this vote concerns all of the following parts:
   1. Maven artifact group "org.apache.myfaces.core" v2.3.0  [1]

The artifacts were deployed on nexus repo [1] for binary and source packages.

The release notes could be found at [4].

Also the japicmp tool (similar to clirr) does not show binary incompatibilities with myfaces-api.

Please take a look at the "2.3.0" artifacts and vote! (see [3])

Please note: This vote is "majority approval" with a minimum of three +1 votes (see [2]).

------------------------------------------------
[ ] +1 for community members who have reviewed the bits
[ ] +0
[ ] -1 for fatal flaws that should cause these bits not to be released, and why..............
------------------------------------------------

Thanks,
Eduardo M. Breijo

[1] https://repository.apache.org/content/repositories/orgapachemyfaces-1130/org/apache/myfaces/core/
[2] http://www.apache.org/foundation/voting.html#ReleaseVotes
[3] https://repository.apache.org/content/repositories/orgapachemyfaces-1130/org/apache/myfaces/core/myfaces-core-assembly/
[4] https://issues.apache.org/jira/secure/ReleaseNote.jspa?projectId=10600&version=12339569
```

**NOTE**: To generate the ReleaseNote you need to go to the JIRA dashboard. Then go to MyFaces Core project. Finally go to the version to be released (example 2.3.0) and click "Release Notes" button.


## 7. Vote closed, starting distribution

#### 7.1 Close repository

Now that the voting is closed, go the [Nexus Repository](https://repository.apache.org/) and find the myfaces 2.3.0 repo (example: orgapachemyfaces-1130) and click the release button (the automatically drop after release checkbox is checked by default, leave it checked). More information here: [Close and drop or release your staging repository](http://central.sonatype.org/pages/releasing-the-deployment.html#close-and-drop-or-release-your-staging-repository)

Some useful links/resources:
* Link with information about where we need to upload the assembly files: [Where do release go](http://www.apache.org/legal/release-policy.html#where-do-releases-go)
* How to upload a release: [Upload CI](http://www.apache.org/legal/release-policy.html#upload-ci)

#### 7.2 Upload artifacts to distribution

##### 7.2.1 Use the script
You can use the MyFaces Release Artifacts script to download the assembly files from [Released MyFaces Core Assembly](https://repository.apache.org/content/repositories/releases/org/apache/myfaces/core/myfaces-core-assembly/) and upload them to SVN dist repo: [MyFaces Distribution Repository](https://dist.apache.org/repos/dist/release/myfaces)

To execute the script run: "./release-artifacts.sh <version> <svn_username>" <br/>
Example: ./release-artifacts.sh 2.3.0 yourusername  
  

**NOTE**: Depending on the operating system, you might need to change the following line in the script to use "f" instead of "file" if you get this issue: "find: Arguments to -type should contain only one letter" 
```
# Note that "f" is being used instead of "file"
for file in $(find . -type f -name "${PATTERN}" -exec basename \{\} \; ) ; do
```


##### 7.2.2 Upload it manually
Otherwise, use an SVN client and add the release artifacts to the SVN dist repo: [MyFaces Distribution Repository](https://dist.apache.org/repos/dist/release/myfaces)
* myfaces-core-assembly-${VERSION}-bin.* should go under the binaries directory
* myfaces-core-assembly-${VERSION}-src.* should go under the source directory

**NOTE**: Providing MD5 or SHA1 checksum files is now discouraged for new releases, but still allowed for past releases. From now on, use the SHA512 checksum files generated by The MyFaces Release Artifacts script.


Files can also be found in the following link once they are added to the SVN repo: [MyFaces Distribution Server](http://www.apache.org/dist/myfaces/)  

Remove the previous release from both binaries and source directories of the svn dist repo after adding the new release: [MyFaces Distribution Repository](https://dist.apache.org/repos/dist/release/myfaces)
* Command: svn delete URL... -m "commit message"
* Example: svn delete https://dist.apache.org/repos/dist/release/myfaces/source/myfaces-core-assembly-2.3.0-src.tar.gz -m "delete 2.3.0 source"
* Note that you need to delete the previous release files one by one from both binaries and source directories.

#### 7.3 Add release to Reporter
Add the release version and date to the Apache Committee Report Helper: [Add Release](https://reporter.apache.org/addrelease.html?myfaces)


## 8. Update Homepage

* Checkout the homapage via [GitBox](https://gitbox.apache.org/repos/asf?p=myfaces-homepage.git)
* Update coreX.md: Update the links in the Download section and the version in the Depedency section
* Update news.md: Add a new entry for the release
* The Apache Bot will synchronize it after some minutes

## 9. Announce

Sent announcement mail
```
To: announce@apache.org, announce@myfaces.apache.org  
Cc: dev@myfaces.apache.org, users@myfaces.apache.org   
```

with subject

```
Subject: [ANNOUNCE] MyFaces Core v2.3.0 Release
```

and content

```
The Apache MyFaces team is pleased to announce the release of MyFaces Core 2.3.0.

MyFaces Core is a JavaServer(tm) Faces 2.3 implementation as specified by JSR-372.

JavaServer Faces (JSF) is a Java specification for building component-based user interfaces for web applications.

MyFaces Core 2.3.0 is available in both binary and source distributions.

    * http://myfaces.apache.org/download.html

MyFaces Core is also available in the central Maven repository under Group ID "org.apache.myfaces.core".

Release Notes - MyFaces Core - Version 2.3.0 can be found in the following link: 
https://issues.apache.org/jira/secure/ReleaseNote.jspa?projectId=10600&version=12339569

Regards,
Eduardo M. Breijo
```    


**NOTE**: If you use your personal email to send the announcement to announce@apache.org and announce@myfaces.apache.org it will bounce back and it will not be delivered. To get around this, please login into the apache webclient Announce @ Apache and Announce @ MyFaces Apache. You need to use your apache id credentials and from each list, start a new discussion in the top right corner.
