#!/bin/bash

path_app=`realpath "$0"`
path_app=`dirname "$path_app"`
cd "$path_app"
bash ./kwin.sh
bash ./kio.sh
bash ./dolphin.sh
