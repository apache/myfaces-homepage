#! /bin/bash

# This script can be called directly like this.
# curl -s -f https://raw.githubusercontent.com/apache/myfaces-homepage/master/tobago/tobago-vm/setup.sh | bash

set -e

BRANCH=main
#BRANCH=tobago-vm

cd /home/tobago
curl https://codeload.github.com/apache/myfaces-homepage/tar.gz/refs/heads/${BRANCH} | tar xz --strip=2 myfaces-homepage-${BRANCH}/tobago/tobago-vm

cd tobago-vm

TOBAGO_6_VERSION=6.12.3-SNAPSHOT
TOBAGO_4_VERSION=4.7.0-SNAPSHOT
TOBAGO_2_VERSION=2.6.0-SNAPSHOT

curl -o demo-6-snapshot.war "https://repository.apache.org/service/local/artifact/maven/content?r=snapshots&g=org.apache.myfaces.tobago&a=tobago-example-demo&p=war&v=${TOBAGO_6_VERSION}"
curl -o demo-4-snapshot.war "https://repository.apache.org/service/local/artifact/maven/content?r=snapshots&g=org.apache.myfaces.tobago&a=tobago-example-demo&p=war&v=${TOBAGO_4_VERSION}"
curl -o demo-2-snapshot.war "https://repository.apache.org/service/local/artifact/maven/content?r=snapshots&g=org.apache.myfaces.tobago&a=tobago-example-demo&p=war&v=${TOBAGO_2_VERSION}"

/usr/local/bin/docker compose down
/usr/bin/docker system prune --all -f
/usr/local/bin/docker compose build --pull
/usr/local/bin/docker compose up -d

# need to wait for Let's encrypt doing its job
sleep 60
/usr/bin/docker exec tobago-vm_apache_1 apachectl graceful
