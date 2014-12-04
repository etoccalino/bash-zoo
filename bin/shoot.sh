#! /bin/bash

PROGRAM=$1
shift

${PROGRAM} "$*" &>/dev/null &

echo $!
