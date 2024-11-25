#这个配置的作用和setxkbmap 是一样的
#但是setxkbmap在插拔键盘的时候会重置,不过这里似乎情况也一样
kwriteconfig5 --file ~/.config/kiorc --group Layout --key Options "numpad:mac,keypad:pointerkeys,caps:escape"
