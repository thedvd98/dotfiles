#!/bin/sh

case $(hostname) in
    "vxwin") scrot "%Y-%m-%d_%H-%M-%S.png" -s -e 'mv $f ~/img/screenshots/';;
    "segfault") maim -s ~/Pictures/screenshots/screenshot_$(date +'%Y-%m-%d-%T').png;;
esac

