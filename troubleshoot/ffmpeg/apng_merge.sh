#把png合并为apng

#先转换为mp4测试帧率, 转换apng 的花费太大
ffmpeg -framerate 30 -i out/thumb%04d.png 3.mp4

ffmpeg -framerate 30 -i out/thumb%04d.png 3.apng

#webp似乎压缩率更高.
ffmpeg -i 3.apng -loop 0 4.webp

