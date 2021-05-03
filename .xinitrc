#!/bin/sh

setxkbmap -model pc105 -layout us -option ctrl:nocaps &
feh --bg-max ~/img/walls/v12.jpg &
exec dwm
