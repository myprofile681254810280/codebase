"""
在一张图表上看所有disk

在plasmashell桌面上找到插件。

    k='plugin' 
    s=f1(gs,k)
    if s=='org.kde.desktopcontainment':break

    k='plugin' 
    s=f1(gs,k)
    if s=='org.kde.plasma.systemmonitor':break

这个插件其实被cpu和内存共用，而我们这里只找第一个插件，所以执行的时候不能先放cpu 和内存

"""
import sys
import subprocess
import os.path
def link_map(p0):
    m={}
    for uuid in os.listdir(p0):
        p1=p0+'/'+uuid
        p2=os.path.realpath(p1)
        _,n2=os.path.split(p2)
        m[n2]=uuid
    return m

# uuid
m1=link_map('/dev/disk/by-uuid')
# label
m2=link_map('/dev/disk/by-id')
import re
s=subprocess.check_output(['df','-h']).decode()
#disk mount
m3={k:v for k,v in re.findall('/dev/([^\\s]+).+?(/mnt/raid/\\d+)',s)}
#disk size
m4={k:v for k,v in re.findall('/dev/([^\\s]+)\\s+([^\\s]+)',s)}
disk_map=[(m3.get(k,m2[k])+' '+m4.get(k,''),m1[k]) for k in m1]


p0='~/.config/plasma-org.kde.plasma.desktop-appletsrc'
p0=os.path.expanduser(p0)
#读取
def f1(gs,k):
    cmd=['kreadconfig6','--file',p0,]+['--key',k]
    for g in gs:
        cmd+=['--group',g]
    s=subprocess.check_output(cmd)
    s=s.strip().decode()
    return s

#写入
def f2(gs,k,v):
    cmd=['kwriteconfig6','--file',p0,]+['--key',k]
    for g in gs:
        cmd+=['--group',g]
    cmd+=[v]
    s=subprocess.check_output(cmd)
    s=s.strip().decode()
    return s
#找到i1
for i1 in range(1000):
    gs='Containments',str(i1) #'38','Applets','44','Configuration'
    k='plugin' 
    s=f1(gs,k)
    if s=='org.kde.desktopcontainment' or s=='org.kde.plasma.folder':break
else:
    sys.exit()
print(i1)
#找到i2
for i2 in range(1000):
    gs='Containments',str(i1) ,'Applets',str(i2) #'44','Configuration'
    k='plugin' 
    s=f1(gs,k)
    if s=='org.kde.plasma.systemmonitor':break
else:
    sys.exit()
print(i2)

#命名
gs='Containments',str(i1) ,'Applets',str(i2),'Configuration','SensorLabels'
sensors=[]
for label,uuid in sorted(disk_map):
    k=f'disk/{uuid}/read'
    sensors.append(k)
    f2(gs,k,label+' r')
    k=f'disk/{uuid}/write'
    sensors.append(k)
    f2(gs,k,label+' w')
#排序
#加入网速
sensors=['network/all/download','network/all/upload']+sensors
gs='Containments',str(i1) ,'Applets',str(i2),'Configuration','Sensors'
k='highPrioritySensorIds'
v='["'+'","'.join(sensors)+'"]'
f2(gs,k,v)

f2(gs,'lowPrioritySensorIds','["memory/physical/usedPercent"]')
