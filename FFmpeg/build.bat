@echo off

call docker build -f Dockerfile -t fushixin/ffmpeg .

call docker tag fushixin/ffmpeg fushixin/ffmpeg:6.0

call docker push fushixin/ffmpeg:6.0

call docker push fushixin/ffmpeg

call docker rmi fushixin/ffmpeg

exit /b 0