FROM openjdk:8-jdk-alpine

MAINTAINER fushixin "fushixin.vip@gmail.com"

ENV INSTALL_PATH /usr/local/docker
ENV ACTIVEMQ_VERSION 5.16.6
ENV ACTIVEMQ apache-activemq-$ACTIVEMQ_VERSION
ENV ACTIVEMQ_HOME $INSTALL_PATH/activemq

RUN apk add --update curl && \
    rm -rf /var/cache/api/* && \
    mkdir -p $INSTALL_PATH && \
    curl -s -S https://archive.apache.org/dist/activemq/$ACTIVEMQ_VERSION/$ACTIVEMQ-bin.tar.gz \
    | tar -xvz -C $INSTALL_PATH && \
    mv $INSTALL_PATH/$ACTIVEMQ $ACTIVEMQ_HOME && \
    addgroup -S activemq && \
    adduser -S -H -G activemq -h $ACTIVEMQ_HOME activemq && \
    chown -R activemq:activemq $ACTIVEMQ_HOME && \
    chown -h activemq:activemq $ACTIVEMQ_HOME

ADD jetty.xml $ACTIVEMQ_HOME/conf
ADD activemq.xml $ACTIVEMQ_HOME/conf

EXPOSE 1883 1099 8161 61616 5672 61613 61614

USER activemq
WORKDIR $ACTIVEMQ_HOME

CMD ["/bin/sh","-c", "bin/activemq console"]