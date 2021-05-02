#!/bin/sh

setxkbmap -model pc105 -layout us -option ctrl:nocaps
exec dwm
