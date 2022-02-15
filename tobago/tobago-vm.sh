#! /bin/bash

set -e

BRANCH=master
#BRANCH=tobago-vm

curl https://codeload.github.com/apache/myfaces-homepage/tar.gz/refs/heads/${BRANCH} | tar xz --strip=2 myfaces-homepage-${BRANCH}/tobago/tobago-vm

cd tobago-vm

docker-compose down
docker system prune
docker-build
docker-compose up -d
