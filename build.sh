#!/bin/bash
NUTTX_DIR=$(pwd)/nuttx
# cmake --build build -t clean
cd build
cmake $NUTTX_DIR -DBOARD_CONFIG=stm32f103-alientek:nsh -GNinja
ninja
size nuttx
