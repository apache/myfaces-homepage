#! /bin/bash

set -e

#BRANCH=master
BRANCH=tobago-vm

curl https://codeload.github.com/apache/myfaces-homepage/tar.gz/refs/heads/${BRANCH} | tar xz --strip=2 myfaces-homepage-tobago-vm/tobago/${BRANCH}

cd tobago-vm

#docker compose down
#docker system prune
#docker compose up -d
