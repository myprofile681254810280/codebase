"""
用来debug,记录有哪些event
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
root.change_attributes(event_mask=X.SubstructureNotifyMask | X.KeyPressMask | X.KeyReleaseMask | X.StructureNotifyMask)

while True:
    e = disp.next_event()
    if e.type in [
    #X.CreateNotify,
            X.MapNotify,
    #X.VisibilityNotify,
    #似乎这个才是最有效的标记
            X.ReparentNotify,
    #这个标记似乎和keyboard无关
            X.KeymapNotify,
    #这些或许没法全局拦截?
            X.KeyPress,
            X.KeyRelease,
    ]:
        print(e.type)
