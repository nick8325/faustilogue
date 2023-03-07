#!/bin/sh
set -e
export PLATFORMDIR=~/prog/others/logue-sdk/platform/minilogue-xd
mkdir -p build
faust -a logue_device.arch -nvi sawtooth.faust > build/sawtooth_device.cpp
make
