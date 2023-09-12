FROM alpine:latest

MAINTAINER fushixin.vip@gmail.com

RUN apk update && apk add ffmpeg

ENV FFMPEG_VERSION 6.0

WORKDIR /

RUN mkdir data

WORKDIR /data

CMD ["/bin/sh","-c", "while true; do sleep 3600; done"]
cd