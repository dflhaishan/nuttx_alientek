#!/bin/bash
cmake -S nuttx_os -B build -DBOARD_CONFIG=stm32f103-alientek:nsh -GNinja
cmake --build build --parallel
#cmake --install build --prefix build/staging/
size build/nuttx
