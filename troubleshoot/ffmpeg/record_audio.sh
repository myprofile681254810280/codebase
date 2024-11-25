
#2018-01-14 20:32:18 Sun CST
#记录下音乐,传到pacman -S picard 然后识别
"""
可用的网站:
需要google api,不用似乎打不开
http://audiotag.info/index.php

网页版的很难用.ipad上有
soundhound 和shazam,用电脑放MP3后用ipad接收可以识别
其中shazam 准确度高很多,用起来很轻松

"""
ffmpeg -f pulse -ac 2 -i default /dev/shm/output.mp3
