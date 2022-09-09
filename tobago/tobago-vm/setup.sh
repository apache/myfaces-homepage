#! /bin/bash

# This script can be called directly like this.
# curl -s -f https://raw.githubusercontent.com/apache/myfaces-homepage/master/tobago/tobago-vm/setup.sh | bash

set -e

BRANCH=main
#BRANCH=tobago-vm

cd /home/tobago
curl https://codeload.github.com/apache/myfaces-homepage/tar.gz/refs/heads/${BRANCH} | tar xz --strip=2 myfaces-homepage-${BRANCH}/tobago/tobago-vm

cd tobago-vm

/usr/local/bin/docker-compose down
/usr/bin/docker system prune -f
/usr/local/bin/docker-compose build
/usr/local/bin/docker-compose up -d

# need to wait for Let's encrypt
sleep 60
/usr/bin/docker exec tobago-vm_apache_1 apachectl graceful
