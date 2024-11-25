#!/bin/bash
#这个脚本不需要了,同样的效果可以通过修改 ~/.config/breezerc 获得
#似乎不能


#这里不用绝对路径,kwrite不会接收
meta=~/.local/share/plasma/desktoptheme/default/metadata.desktop 

mkdir -p ~/.local/share/plasma/desktoptheme/
#修改breeze中的contrast
if [ -f $meta ];then
    echo exist
else
    cp /usr/share/plasma/desktoptheme/default ~/.local/share/plasma/desktoptheme/default -r
fi


#以下基本上是一个类同air的白色主题,基本上加强饱和度,都会使得颜色变亮
kwriteconfig6 --file $meta --group ContrastEffect --key enabled true
#对比度,越低越亮
kwriteconfig6 --file $meta --group ContrastEffect --key contrast 1.0
kwriteconfig6 --file $meta --group ContrastEffect --key intensity 1.2
#2.0是个差不多的数值,饱和度更高就会出现明显色块,颜色过度不再平滑
kwriteconfig6 --file $meta --group ContrastEffect --key saturation 2.0


