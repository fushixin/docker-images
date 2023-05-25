## docker

```
docker run -v 'E:\output:/data/output' fushixin/ffmpeg:4.4.1 ffmpeg -i rtmp://ns8.indexforce.com/home/mystream -c copy -f hls -hls_list_size 2 -hls_flags 2 /data/output/stream1.m3u8
```

## docker-compose

```
version: '3'

services:
  ffmpeg:
    image: 'fushixin/ffmpeg:4.4.1'
    container_name: ffmpeg
    restart: always
    volumes:
      - 'E:\output:/data/output'
    command: ffmpeg -i rtmp://ns8.indexforce.com/home/mystream -c copy -f hls -hls_list_size 2 -hls_flags 2 /data/output/stream1.m3u8
```