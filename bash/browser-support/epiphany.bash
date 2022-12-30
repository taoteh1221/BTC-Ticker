#!/bin/bash

# Copyright 2019-2023 GPLv3, Slideshow Crypto Ticker by Mike Kilday: http://DragonFrugal.com

				
FIND_DISPLAY=$(w -h $USER | awk '$3 ~ /:[0-9.]*/{print $3}')

DISPLAY=$FIND_DISPLAY

export DISPLAY=$FIND_DISPLAY


# Create epiphany user directory if it doesn't exist yet
if [ ! -d ~/.config/epiphany ]; then
mkdir -p ~/.config/epiphany
fi


# epiphany's FULL PATH
EPIPHANY_PATH=$(which epiphany-browser)

# If 'epiphany-browser' wasn't found, look for 'epiphany'
if [ -z "$EPIPHANY_PATH" ]; then
EPIPHANY_PATH=$(which epiphany)
fi

# Reduce crashes
export WEBKIT_DISABLE_TBS=1

# kiosk / private mode (for UX on crashes / restarts / etc)
# --profile needed if FIRST RUN, OTHERWISE IT WON'T START!
# No fullscreen flag, AND -a for kiosk mode doesn't go fullscreen, 
# so we use xte AFTER epiphany starts to toggle fullscreen with F11
# USE #FULL# PATH TO AVOID POSSIBLE BUGS IN BROWSER!
$EPIPHANY_PATH -a -i --profile ~/.config/epiphany $HOME/slideshow-crypto-ticker/index.html --display=$FIND_DISPLAY &
sleep 15
xte "key F11" -x$FIND_DISPLAY

