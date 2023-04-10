@echo off

call docker build -f Dockerfile -t fushixin/activemq:5.16.6 .

call docker push fushixin/activemq:5.16.6

exit /b 0
