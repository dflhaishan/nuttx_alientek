#!/bin/bash
cmake -S nuttx_os -B build -DBOARD_CONFIG=stm32f103-alientek:nsh -GNinja
cmake --build build --parallel
# cmake --install build --prefix build/staging/
# ./nuttx_os/tools/build/mksymtab -d nuttx_os/libs/libc/libc.csv /home/jhs/nuttx/nuttx_os/boards/arm/stm32/stm32f103-alientek/src/generated_symtab.c
size build/nuttx
