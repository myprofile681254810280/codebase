#禁止程序阻断composite, 主要对wesnoth有效
kwriteconfig5 --file ~/.config/kwinrc --group Compositing --key WindowsBlockCompositing false

#等同compiz expo
kwriteconfig5 --file ~/.config/kwinrc --group Effect-DesktopGrid --key ZoomDuration 500
kwriteconfig5 --file ~/.config/kwinrc --group Effect-DesktopGrid --key BorderWidth 0
#关掉后,不改变缩略窗口布局, 使得可以自制window作为壁纸
kwriteconfig5 --file ~/.config/kwinrc --group Effect-DesktopGrid --key PresentWindows false
#必须要按钮改动桌面数目,因为我们都用整数数目,还是需要去setting配置
kwriteconfig5 --file ~/.config/kwinrc --group Effect-DesktopGrid --key ShowAddRemove false

#等同compiz wall
kwriteconfig5 --file ~/.config/kwinrc --group Effect-Slide --key Duration 800
kwriteconfig5 --file ~/.config/kwinrc --group Effect-Slide --key HorizontalGap 0
kwriteconfig5 --file ~/.config/kwinrc --group Effect-Slide --key VerticalGap 0

#blur强度,尤其如果开了contrast的话就很需要加强blur减小梯度
kwriteconfig5 --file ~/.config/kwinrc --group Effect-Blur --key BlurStrength 15
#noise开了会显得脏兮兮
kwriteconfig5 --file ~/.config/kwinrc --group Effect-Blur --key NoiseStrength 0

#virtual desktop,这部份需要手动调整
#kwin极限是20个desktop,比compiz少多了
kwriteconfig5 --file ~/.config/kwinrc --group Desktops --key Rows 4
kwriteconfig5 --file ~/.config/kwinrc --group Desktops --key Number 16

#减弱focus控制,使得freetile可以focus窗口
kwriteconfig5 --file ~/.config/kwinrc --group Windows --key FocusStealingPreventionLevel 0
#virtual desktop不循环
kwriteconfig5 --file ~/.config/kwinrc --group Windows --key RollOverDesktops false

#换成经典的alt tab窗口切换,
#kwriteconfig5 --file ~/.config/kwinrc --group TabBox --key LayoutName thumbnails
#kwriteconfig5 --file ~/.config/kwinrc --group TabBoxAlternative n4_effect_fadingpopupsEnabled=false
#--key LayoutName thumbnails
#但是上面这种无法现实所有窗口.下面这种才行,就是换行太快,占据屏幕面积太大
#kwriteconfig5 --file ~/.config/kwinrc --group TabBox --key LayoutName present_windows
#kwriteconfig5 --file ~/.config/kwinrc --group TabBoxAlternative --key LayoutName present_windows
#新版的切换
kwriteconfig5 --file ~/.config/kwinrc --group TabBox --key LayoutName thumbnail_grid
kwriteconfig5 --file ~/.config/kwinrc --group TabBoxAlternative --key LayoutName thumbnail_grid 

#去掉选择高亮
kwriteconfig5 --file ~/.config/kwinrc --group TabBox --key HighlightWindows false
kwriteconfig5 --file ~/.config/kwinrc --group TabBoxAlternative --key HighlightWindows false
#一个跨桌面,另一个不跨,两者都忽略最小化窗口
kwriteconfig5 --file ~/.config/kwinrc --group TabBox --key ActivitiesMode 0
kwriteconfig5 --file ~/.config/kwinrc --group TabBox --key DesktopMode 0
kwriteconfig5 --file ~/.config/kwinrc --group TabBox --key MinimizedMode 1
kwriteconfig5 --file ~/.config/kwinrc --group TabBoxAlternative --key ActivitiesMode 1
kwriteconfig5 --file ~/.config/kwinrc --group TabBoxAlternative --key DesktopMode 1
kwriteconfig5 --file ~/.config/kwinrc --group TabBoxAlternative --key MinimizedMode 1

#关掉窗口透明,出现于移动窗口的时候
kwriteconfig5 --file ~/.config/kwinrc --group Plugins --key kwin4_effect_translucencyEnabled false
#这个fading效果会使得fcitx的窗口弹出关闭速度变得太慢.
kwriteconfig5 --file ~/.config/kwinrc --group Plugins --key kwin4_effect_fadingpopupsEnabled false
#virtual workspace移动时显示在哪个位置
kwriteconfig5 --file ~/.config/kwinrc --group Plugins --key desktopchangeosdEnabled true
#login与我们无关
kwriteconfig5 --file ~/.config/kwinrc --group Plugins --key kwin4_effect_loginEnabled false
kwriteconfig5 --file ~/.config/kwinrc --group Plugins --key kwin4_effect_logoutEnabled false
#增强半透明背后的可读性，因为有blur，所以无用
kwriteconfig5 --file ~/.config/kwinrc --group Plugins --key contrastEnabled false
#可疑的全局显示窗口，完全不需要
kwriteconfig5 --file ~/.config/kwinrc --group Plugins --key overviewEnabled false
kwriteconfig5 --file ~/.config/kwinrc --group Plugins --key windowviewEnabled false

#窗口从最小化恢复的时候,有时候会触发virtual desktop的转移,和下面的窗口关闭一样,这种情形极易导致kwin crash
#调整两个窗口最小化效果.
kwriteconfig5 --file ~/.config/kwinrc --group Plugins --key magiclampEnabled false
kwriteconfig5 --file ~/.config/kwinrc --group Plugins --key kwin4_effect_squashEnabled false
#窗口关闭. 不过没有粒子效果那么平和,
#关闭窗口同时切换virtual desktop的话,这里似乎容易crash
kwriteconfig5 --file ~/.config/kwinrc --group Plugins --key fallapartEnabled false
kwriteconfig5 --file ~/.config/kwinrc --group Plugins --key kwin4_effect_fadeEnabled false
#关掉显示全部窗口的功能
kwriteconfig5 --file ~/.config/kwinrc --group Plugins --key presentwindowsEnabled false

#decor主题,0边框,目前只有Breeze表现正常,不过阴影或许太大了
kwriteconfig5 --file ~/.config/kwinrc --group org.kde.kdecoration2 --key BorderSize None
kwriteconfig5 --file ~/.config/kwinrc --group org.kde.kdecoration2 --key theme Breeze
#标题栏按钮
kwriteconfig5 --file ~/.config/kwinrc --group org.kde.kdecoration2 --key ButtonsOnLeft M
kwriteconfig5 --file ~/.config/kwinrc --group org.kde.kdecoration2 --key ButtonsOnRight IAX



#解放按键
kwriteconfig5 --file ~/.config/kglobalshortcutsrc --group ksmserver --key "Lock Session" "Screensaver,none,Lock Session"
kwriteconfig5 --file ~/.config/kglobalshortcutsrc --group kwin --key "Window Quick Tile Bottom" "none,Meta+Down,Quick Tile Window to the Bottom"
kwriteconfig5 --file ~/.config/kglobalshortcutsrc --group kwin --key "Window Quick Tile Left" "none,Meta+Left,Quick Tile Window to the Left"
kwriteconfig5 --file ~/.config/kglobalshortcutsrc --group kwin --key "Window Quick Tile Right" "none,Meta+Right,Quick Tile Window to the Right"
kwriteconfig5 --file ~/.config/kglobalshortcutsrc --group kwin --key "Window Quick Tile Top" "none,Meta+Up,Quick Tile Window to the Top"
#窗口切换
kwriteconfig5 --file ~/.config/kglobalshortcutsrc --group kwin --key "Walk Through Windows" "Alt+Tab,none,Walk Through Windows"
kwriteconfig5 --file ~/.config/kglobalshortcutsrc --group kwin --key "Walk Through Windows Alternative" "Meta+Tab,none,Walk Through Windows Alternative"
#移动virtual desktop
kwriteconfig5 --file ~/.config/kglobalshortcutsrc --group kwin --key "Switch One Desktop Down" "Ctrl+Alt+J,none,Switch One Desktop Down"
kwriteconfig5 --file ~/.config/kglobalshortcutsrc --group kwin --key "Switch One Desktop Up" "Ctrl+Alt+K,none,Switch One Desktop Up"
kwriteconfig5 --file ~/.config/kglobalshortcutsrc --group kwin --key "Switch One Desktop to the Left" "Ctrl+Alt+H,none,Switch One Desktop to the Left"
kwriteconfig5 --file ~/.config/kglobalshortcutsrc --group kwin --key "Switch One Desktop to the Right" "Ctrl+Alt+L,none,Switch One Desktop to the Right"
kwriteconfig5 --file ~/.config/kglobalshortcutsrc --group kwin --key "Window One Desktop Down" "Ctrl+Alt+Shift+J,none,Window One Desktop Down"
kwriteconfig5 --file ~/.config/kglobalshortcutsrc --group kwin --key "Window One Desktop Up" "Ctrl+Alt+Shift+K,none,Window One Desktop Up"
kwriteconfig5 --file ~/.config/kglobalshortcutsrc --group kwin --key "Window One Desktop to the Left" "Ctrl+Alt+Shift+H,none,Window One Desktop to the Left"
kwriteconfig5 --file ~/.config/kglobalshortcutsrc --group kwin --key "Window One Desktop to the Right" "Ctrl+Alt+Shift+L,none,Window One Desktop to the Right"
#expo
kwriteconfig5 --file ~/.config/kglobalshortcutsrc --group kwin --key "ShowDesktopGrid" "Meta+S,Ctrl+F8,Show Desktop Grid"
#最大化
kwriteconfig5 --file ~/.config/kglobalshortcutsrc --group kwin --key "Window Operations Menu" "Alt+Space,Alt+F3,Window Operations Menu"
#关闭窗口
kwriteconfig5 --file ~/.config/kglobalshortcutsrc --group kwin --key "Window Close" "Meta+Shift+Q,Alt+F4,Close Window"



#鼠标主题
kwriteconfig5 --file ~/.config/kcminputrc --group Mouse --key cursorTheme default

#把控制权从qt5ct改到kde后,需要从kde中选择kvantum
kwriteconfig5 --file ~/.config/kdeglobals --group KDE --key widgetStyle kvantum
#控制dolphin中鼠标滚动的行数.似乎滚动单位被改了
kwriteconfig5 --file ~/.config/kdeglobals --group KDE --key WheelScrollLines 4
#配色
kwriteconfig5 --file ~/.config/kdeglobals --group General --key ColorScheme KvArc
#图标,不可以放~/.icons 必须放~/.local/share/.icons  这个配置在这里似乎没用,需要手动选择才能起效
kwriteconfig5 --file ~/.config/kdeglobals --group Icons --key Theme la-capitaine-icon-theme

#关闭splash
kwriteconfig5 --file ~/.config/ksplashrc --group KSplash --key Engine none
kwriteconfig5 --file ~/.config/ksplashrc --group KSplash --key Theme None

#没用,但是重启kwin后有用
#qdbus org.kde.KWin /KWin reconfigure

#左上角触发关闭
kwriteconfig5 --file ~/.config/kwinrc --group Effect-windowview --key BorderActivateAll 9
