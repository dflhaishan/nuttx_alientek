#!/bin/bash
cmake -S nuttx -B build -DBOARD_CONFIG=stm32f103-alientek:nsh -GNinja
cmake --build build --parallel
size build/nuttx
