FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y -qq --force-yes python3-pip ffmpeg

RUN apt-get install -y -qq --force-yes cron

RUN python3 -m pip install yt-dlp

RUN mkdir /media

COPY ytdl-cron /etc/cron.d/ytdl-cron
RUN chmod 0644 /etc/cron.d/ytdl-cron
RUN crontab /etc/cron.d/ytdl-cron

COPY ytdl.sh /opt/ytdl.sh
RUN chmod 0744 /opt/ytdl.sh

CMD ["cron", "-f"]