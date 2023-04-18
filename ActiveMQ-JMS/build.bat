@echo off

call docker build -f Dockerfile -t fushixin/activemq:5.16.6-jms .

call docker push fushixin/activemq:5.16.6-jms

call docker rmi fushixin/activemq:5.16.6-jms

exit /b 0
