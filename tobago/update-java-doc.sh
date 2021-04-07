#! /bin/bash
set -e

echo "Preparing docs from a new release."

if [ $# -ne 1 ]; then
    echo "Usage: $0 <version>"
    exit 1
fi

VERSION=$1

REPOSITORY=https://repository.apache.org/content/repositories/releases

JAVADOC=tobago-core-$VERSION-javadoc.jar

cd doc

if which curl >/dev/null; then
  # curl
  curl --fail $REPOSITORY/org/apache/myfaces/tobago/tobago-core/$VERSION/${JAVADOC}             -o ${JAVADOC}
else
  # wget
  wget --no-check-certificate --user-agent="" $REPOSITORY/org/apache/myfaces/tobago/tobago-core/$VERSION/${JAVADOC}
fi

mkdir -p $VERSION/api
cd $VERSION/api
jar xvf ../../$JAVADOC
rm -r META-INF
cd ../..

rm $JAVADOC

cd ..
