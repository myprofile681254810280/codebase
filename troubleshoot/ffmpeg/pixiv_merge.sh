#
#格式选择
#apng ff57可用,但是太大
#webm, 最小,但是质量差
#webp 第二大, 并且dolphin不可预览
#mp4 质量不差, dolphin可以预览,注意安装插件

ffmpeg -framerate 15 -i "$1/%06d.jpg" "$1.mp4"
