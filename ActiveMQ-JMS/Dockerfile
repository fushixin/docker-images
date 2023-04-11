FROM openjdk:8-jdk-alpine

MAINTAINER fushixin "fushixin.vip@gmail.com"

ENV INSTALL_PATH /usr/local/docker
ENV ACTIVEMQ_VERSION 5.16.6
ENV ACTIVEMQ apache-activemq-$ACTIVEMQ_VERSION
ENV ACTIVEMQ_RMI_SERVER_HOSTNAME localhost
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

RUN sed -i 's/property name="host" value="127.0.0.1"\/>/property name="host" value="0.0.0.0"\/>/g' $ACTIVEMQ_HOME/conf/jetty.xml
RUN sed -i 's/<managementContext createConnector=\"false\"\/>/<managementContext connectorPort=\"1099\"\/>/g' $ACTIVEMQ_HOME/conf/activemq.xml
RUN echo 'ACTIVEMQ_OPTS="$ACTIVEMQ_OPTS -Djava.rmi.server.hostname=$ACTIVEMQ_RMI_SERVER_HOSTNAME -Dcom.sun.management.jmxremote.port=1099 -Dcom.sun.management.jmxremote.rmi.port=1099 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false -Dhawtio.authenticationEnabled=false -Dhawtio.realm=activemq -Dhawtio.role=admins -Dhawtio.rolePrincipalClasses=org.apache.activemq.jaas.GroupPrincipal"' >> $ACTIVEMQ_HOME/bin/env

USER activemq
WORKDIR $ACTIVEMQ_HOME
EXPOSE 61616 5672 61613 1883 61614 8161 1099
CMD ["/bin/sh","-c", "bin/activemq console"]