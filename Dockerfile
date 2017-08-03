FROM sguillen/centos-jre:8
MAINTAINER donkeysharp <serguimant@gmail.com>

RUN yum install -y expat-devel openssl-devel \
    && yum groupinstall -y "Development Tools" \
    && wget -q https://archive.apache.org/dist/apr/apr-1.4.4.tar.gz \
    && wget -q https://archive.apache.org/dist/apr/apr-util-1.4.1.tar.gz \
    && wget -q http://www-us.apache.org/dist/tomcat/tomcat-7/v7.0.79/bin/apache-tomcat-7.0.79.tar.gz \
    && wget --no-cookies --no-check-certificate \
    --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
    http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/jdk-8u144-linux-x64.rpm \
    && yum localinstall -y jdk-8u144-linux-x64.rpm

COPY ./install-apr.sh /root/install-apr.sh
RUN bash /root/install-apr.sh

ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
RUN mkdir -p "$CATALINA_HOME"
WORKDIR $CATALINA_HOME

