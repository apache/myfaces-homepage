#! /bin/bash
set -e

echo "Preparing docs from a new release."

if [ $# -ne 1 ]; then
    echo "Usage: $0 <version>"
    exit 1
fi

VERSION=$1

REPOSITORY=https://repository.apache.org/content/repositories/releases

TLDDOC=tobago-core-$VERSION-tlddoc.jar

cd doc

if which curl >/dev/null; then
  # curl
  curl --fail $REPOSITORY/org/apache/myfaces/tobago/tobago-core/$VERSION/${TLDDOC}              -o ${TLDDOC}
else
  # wget
  wget --no-check-certificate --user-agent="" $REPOSITORY/org/apache/myfaces/tobago/tobago-core/$VERSION/${TLDDOC}
fi

mkdir -p $VERSION/tld
cd $VERSION/tld
jar xvf ../../$TLDDOC
rm -r META-INF
cd ../..

rm $TLDDOC

cd ..
