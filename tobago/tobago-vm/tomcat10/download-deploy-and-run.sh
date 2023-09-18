#! /bin/bash

# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

if [[ ${TOBAGO_VERSION} == *-SNAPSHOT ]]; then
   REPO=snapshots
elif [[ ${STAGING_NUMBER} ]]; then
#todo: not tested yet
  REPO=orgapachemyfaces-${STAGING_NUMBER}
else
  REPO=releases
fi

TARGET=/usr/local/tomcat/webapps/${CONTEXT_PATH}
ARTIFACT=/usr/local/tomcat/tobago-example-demo-${TOBAGO_VERSION}.war

set -x
curl -o ${ARTIFACT} "https://repository.apache.org/service/local/artifact/maven/content?r=${REPO}&g=org.apache.myfaces.tobago&a=tobago-example-demo&p=war&v=${TOBAGO_VERSION}"

mkdir -p ${TARGET}
pushd ${TARGET} && jar xf ${ARTIFACT}

catalina.sh run
