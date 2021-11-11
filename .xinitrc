#!/bin/sh

setxkbmap -model pc105 -layout us -option ctrl:nocaps,compose:ralt &
#feh --bg-max ~/img/walls/v12.jpg &
#autocutsel -fork -selection CLIPBOARD
#autocutsel -fork -selection PRIMARY
exec startxfce4
