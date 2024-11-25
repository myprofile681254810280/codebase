#!/bin/bash
sleep 5
focused_window_id=$(xdotool getwindowfocus)
active_window_id=$(xdotool getactivewindow)
xprop -id $focused_window_id
xprop -id $active_window_id
