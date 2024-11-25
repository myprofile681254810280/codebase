#重命名被抽取的png,使其可以被ffmpeg合并
import sys
import os
root=sys.argv[1]
l=os.listdir(root)
l.sort()
count=1

os.chdir(root)
for n in l:
    os.rename(n,'thumb%04d.png'%count)
    count+=1
