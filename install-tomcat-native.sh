#!/bin/bash

cd /root

cp $CATALINE_HOME/bin/tomcat-native.tar.gz /root
tar xvzf tomcat-native.tar.gz
cd tomcat-native-1.2.12-src/native
./configure --with-apr=/usr/local/apr --with-java-home=/usr/java/jdk1.8.0_144 --without-ssl
