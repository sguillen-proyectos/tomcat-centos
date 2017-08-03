FROM sguillen/centos-jre:8
MAINTAINER donkeysharp <serguimant@gmail.com>

# Docker image with:
#   * Centos6
#   * Java8
#   * Tomcat7
# Without APR support, check Dockerfile.apr

ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
RUN mkdir -p "$CATALINA_HOME"

RUN wget -q http://www-us.apache.org/dist/tomcat/tomcat-7/v7.0.79/bin/apache-tomcat-7.0.79.tar.gz \
    && tar xvzf apache-tomcat-7.0.79.tar.gz -C /usr/local/tomcat --strip-components=1 \
    && rm -f apache-tomcat-7.0.79.tar.gz

WORKDIR $CATALINA_HOME

EXPOSE 8080
CMD ["catalina.sh", "run"]
