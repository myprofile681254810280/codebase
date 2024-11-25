#从视频中抽取png
#cp
#ffmpeg -i 1.mkv 2.mp4
mkdir out
ffmpeg -ss 00:06:29.0 -i 1.mkv -t 00:00:15.0 out/thumb%04d.png
