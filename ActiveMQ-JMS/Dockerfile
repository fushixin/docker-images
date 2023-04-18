FROM openjdk:8-jdk-alpine

MAINTAINER fushixin "fushixin.vip@gmail.com"

ENV ACTIVEMQ_VERSION 5.16.6
ENV ACTIVEMQ apache-activemq-$ACTIVEMQ_VERSION
ENV ACTIVEMQ_HOME /usr/local/activemq
ENV HOSTNAME 127.0.0.1

RUN apk add --update curl && \
    rm -rf /var/cache/api/* && \
    curl -s -S https://archive.apache.org/dist/activemq/$ACTIVEMQ_VERSION/$ACTIVEMQ-bin.tar.gz \
    | tar -xvz -C /usr/local && \
    mv /usr/local/$ACTIVEMQ $ACTIVEMQ_HOME

RUN sed -i 's/<property name="host" value="127.0.0.1"\/>/<property name="host" value="0.0.0.0"\/>/g' $ACTIVEMQ_HOME/conf/jetty.xml
RUN sed -i 's/<broker xmlns=\"http:\/\/activemq.apache.org\/schema\/core\" brokerName=\"localhost\" dataDirectory=\"${activemq.data}\">/<broker xmlns=\"http:\/\/activemq.apache.org\/schema\/core\" brokerName=\"localhost\" dataDirectory=\"${activemq.data}\" useJmx=\"true\">/g' $ACTIVEMQ_HOME/conf/activemq.xml
RUN sed -i 's/<managementContext createConnector=\"false\"\/>/<managementContext createConnector=\"true\"\/>/g' $ACTIVEMQ_HOME/conf/activemq.xml
RUN echo -e '\nACTIVEMQ_OPTS="$ACTIVEMQ_OPTS -Djava.rmi.server.hostname=$HOSTNAME -Dcom.sun.management.jmxremote=true -Dcom.sun.management.jmxremote.port=1099 -Dcom.sun.management.jmxremote.rmi.port=1099 -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false"'>> $ACTIVEMQ_HOME/bin/env

WORKDIR /
EXPOSE 61616 5672 61613 1883 61614 8161 1099
CMD ["/bin/sh","-c", "$ACTIVEMQ_HOME/bin/activemq console"]