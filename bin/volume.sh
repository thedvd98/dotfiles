#!/bin/sh

function volume()
{
    for SINK in $(pacmd list-sinks | grep 'index:' | cut -b12-)
    do
        pactl set-sink-volume $SINK $1
    done
}

case $1 in
    up) volume '+5%';;
    down) volume '-5%';;
    mute) volume '0%';
esac

