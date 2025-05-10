#!/bin/sh

if [ -z $1 ]; then
    echo "$0 ./executable"
    exit 1
fi

perf record -g -o perf.data -- $1
