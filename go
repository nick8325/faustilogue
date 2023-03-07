#!/bin/bash
set -e
FILE=${1-sawtooth.dsp}
export PLATFORMDIR=~/prog/others/logue-sdk/platform/minilogue-xd
mkdir -p build
faust -a src/logue_device.arch -fm $(pwd)/src/fastmath.cpp -nvi $FILE > build/oscillator.cpp
make -C src install
