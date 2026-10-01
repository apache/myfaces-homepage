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

FROM debian:trixie-slim

ENV APACHE_RUN_USER=www-data
ENV APACHE_RUN_GROUP=www-data
ENV APACHE_RUN_DIR=/var/run/apache2
ENV APACHE_LOG_DIR=/var/log/apache2
ENV APACHE_PID_FILE=$APACHE_RUN_DIR/apache2.pid

RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y apache2 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && a2enmod proxy proxy_http ssl md

COPY 000-security.conf 001-default.conf 002-ssl.conf /etc/apache2/sites-available/
COPY *.html *.css *.css.map *.txt /var/www/html/

RUN mkdir -p ${APACHE_RUN_DIR} ${APACHE_LOG_DIR} \
 && a2dissite 000-default \
 && a2ensite 000-security \
 && a2ensite 001-default \
 && a2ensite 002-ssl

EXPOSE 80

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
