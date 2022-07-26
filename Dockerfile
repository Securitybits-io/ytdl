FROM ubuntu:22.04

RUN apt-get update -qq && \
    apt-get install -y python3-pip ffmpeg

RUN apt-get install -y cron

RUN python3 -m pip install yt-dlp

RUN mkdir /ytdl

COPY ytdl-cron /etc/cron.d/ytdl-cron
RUN chmod 0644 /etc/cron.d/ytdl-cron
RUN crontab /etc/cron.d/ytdl-cron

COPY ytdl.sh /opt/ytdl.sh
RUN chmod 0744 /opt/ytdl.sh

CMD ["cron", "-f"]