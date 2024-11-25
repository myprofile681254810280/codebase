"""
这个暂时只对rofi fcitx有效.
可能因为拦截map事件不对,可能因为,blur操作的时间点不对

另一方面,这个脚本会影响到dolphin等的右键菜单的阴影

而如果过滤wm_class,又捉不到rofi,所以最后只对fcitx有效了
"""
from Xlib import X, display
import time
import os
import threading
from ewmh import EWMH

#似乎可以解决server监听的一些错误,多线程下似乎必要
import Xlib.threaded

ewmh = EWMH()
disp = ewmh.display
root = disp.screen().root
root.change_attributes(event_mask=X.SubstructureNotifyMask)

#qt相关的blur由kvantum管理,这里不控制

names = [] #'rofi']
classes = [
    'rofi',
    'fcitx',
    'menu.py',
    #这个其实需要处理blur区域的.和compiz不同kwin把纯透明区域也拉进来了
    'volnoti',
    'onboard',
    #'noblur',
    'myvte-bitmap',
    'panon',
    'qmlterm',
    'ssss',
    #这个似乎开启太早,大概在kvantum起效前,使得kvantum的blur没有作用到这里
    'lxqt-notificationd',
    'volnoti_kwin.py',
    #'dolphin', #kde6 的错误，需要把dolphin加回来
]


#import time
#def setup_blur(win):
#        threading.Thread(target=delay_setup_blur, args=[win.id]).start()
def setup_blur2(win):
    name = win.get_wm_name()
    c = win.get_wm_class()
    print(f'id:{win.id},class:{c},name:{name}') #, win.id, 'class', c, 'name', name)
    #print(win.get_wm_normal_hints())
    if name in names:
        blur(win.id)
    if c is not None:
        for c in c:
            if c in classes:
                blur(win.id)
    time.sleep(1)

#import time
#def delay_setup_blur(winid):
#    time.sleep(1)
#    win = disp.create_resource_object('window', winid)
#    setup_blur2(win)



def blur(wid):
    print('blur',wid)
    blur_cmd = 'xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id %s'
    os.system(blur_cmd % wid)
    #time.sleep(1)
    #os.system(blur_cmd % wid)


while True:
    e = disp.next_event()
    if e.type in [
    #X.CreateNotify,
            X.MapNotify,
    #X.VisibilityNotify,
    #似乎这个才是最有效的标记
            X.ReparentNotify,
    #X.KeymapNotify,
    ]:
        threading.Thread(target=setup_blur2, args=[e.window]).start()
        #import IPython
        #IPython.embed()
        #break
