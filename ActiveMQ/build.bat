@echo off

call docker build -f Dockerfile -t fushixin/activemq:latest .

call docker tag fushixin/activemq:latest fushixin/activemq:5.16.6

call docker push fushixin/activemq:5.16.6

call docker push fushixin/activemq:latest

call docker rmi fushixin/activemq:5.16.6

call docker rmi fushixin/activemq:latest

exit /b 0
