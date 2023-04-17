FROM openjdk:8-jdk-alpine

MAINTAINER fushixin "fushixin.vip@gmail.com"

ENV INSTALL_LOCATION /usr/local
ENV ACTIVEMQ_VERSION 5.16.6
ENV ACTIVEMQ apache-activemq-$ACTIVEMQ_VERSION
ENV ACTIVEMQ_HOME $INSTALL_LOCATION/activemq
ENV HOME /
ENV USER 1001

RUN apk add --update curl && \
    rm -rf /var/cache/api/* && \
    mkdir -p $INSTALL_LOCATION && \
    curl -s -S https://archive.apache.org/dist/activemq/$ACTIVEMQ_VERSION/$ACTIVEMQ-bin.tar.gz \
    | tar -xvz -C $INSTALL_LOCATION && \
    mv $INSTALL_LOCATION/$ACTIVEMQ $ACTIVEMQ_HOME

RUN sed -i 's/property name="host" value="127.0.0.1"\/>/property name="host" value="0.0.0.0"\/>/g' $ACTIVEMQ_HOME/conf/jetty.xml

USER $USER
WORKDIR $HOME
EXPOSE 61616 5672 61613 1883 61614 8161 1099
CMD ["/bin/sh","-c", "$ACTIVEMQ_HOME/bin/activemq console"]