FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y curl python ffmpeg attr jq

RUN curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
RUN chmod a+rx /usr/local/bin/youtube-dl

ENV LC_ALL en_US.utf-8

WORKDIR /home/ytdl

CMD ./ytdl.sh
