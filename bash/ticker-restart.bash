#!/bin/bash

# Copyright 2019-2024 GPLv3, Slideshow Crypto Ticker by Mike Kilday: Mike@DragonFrugal.com (leave this copyright / attribution intact in ALL forks / copies!)


				
FIND_DISPLAY=$(w -h $USER | awk '$3 ~ /:[0-9.]*/{print $3}')

DISPLAY=$FIND_DISPLAY

export DISPLAY=$FIND_DISPLAY

xset s off

xset -dpms

xset s noblank

# firefox is stubborn at refreshing JS
rm -rf ~/.cache/mozilla/firefox/*
sleep 1

# chromium / epiphany / firefox refresh
xdotool key F5