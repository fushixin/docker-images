@echo off

call docker build -f Dockerfile.alpine.latest -t fushixin/ffmpeg:alpine .

call docker push fushixin/ffmpeg:alpine

call docker rmi fushixin/ffmpeg:alpine

exit /b 0