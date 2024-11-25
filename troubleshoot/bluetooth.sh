#基本用不到，作为查阅保留
#pulseaudio -k
bluetoothctl power on
bluetoothctl agent on
bluetoothctl default-agent 
bluetoothctl connect  $?

pamixer --set-volume 15
setxkbmap -option "caps:escape"

pacmd info | grep battery

exit 

bluetoothctl remove $?
bluetoothctl scan on
bluetoothctl pair $?
bluetoothctl trust $?
bluetoothctl connect $?
bluetoothctl show
bluetoothctl devices
bluetoothctl info

bluetoothctl disconnect $?

systemctl status bluetooth
sudo systemctl restart bluetooth

pulseaudio -k
pgrep pulseaudio
systemctl start --user pulseaudio
