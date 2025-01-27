# ytdl
YoutubeDL Docker image with Cron to run every 3rd hour.
The image will look for /ytdl/channels.txt for a list of channels to download.
```
volumes:
  - /docker:/config/channels.txt
```

