#! /bin/bash

set -e

BRANCH=master
#BRANCH=tobago-vm

curl https://codeload.github.com/apache/myfaces-homepage/tar.gz/refs/heads/${BRANCH} | tar xz --strip=2 myfaces-homepage-${BRANCH}/tobago/tobago-vm

cd tobago-vm

docker-compose down
docker system prune -f
docker-compose build
docker-compose up -d

# need to wait for Let's encrypt
sleep 20s
docker exec -it tobago-vm_apache_1 apachectl graceful
