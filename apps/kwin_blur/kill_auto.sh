#!/bin/bash
wid=$(pgrep -a python | grep kwin_auto_blur.py | cut -d" " -f1)
echo $wid
kill $wid
