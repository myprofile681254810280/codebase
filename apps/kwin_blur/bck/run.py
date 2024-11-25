import time
import os
import subprocess

lst = []


def blur(wid):
    blur_cmd = 'xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id %s'
    #    os.system(blur_cmd % wid)
    os.system(blur_cmd % wid)


time.sleep(1)

lines = subprocess.check_output('wmctrl -lxG'.split())
for line in lines.decode().strip().split('\n'):
    wid, _, _, _, _, _, wmclass, = line.split()[:7]
    for wm in wmclass.split('.'):
        if wm in lst:
            blur(wid)
            break
#try:
#    wid = subprocess.check_output('xwininfo -name panon'.split()).split()[3].decode()
#    blur(wid)
#except:
#    pass
