#! /bin/bash

set -e

curl https://codeload.github.com/apache/myfaces-homepage/tar.gz/refs/heads/master | tar xz --strip=2 myfaces-homepage-master/tobago/tobago-vm

cd tobago-vm

#docker compose down
#docker system prune
#docker compose up -d
