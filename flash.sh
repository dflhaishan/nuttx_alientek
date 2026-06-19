#!/bin/bash

openocd -f tools/openocd/interface/stlink.cfg -f tools/openocd/target/stm32f1x.cfg -c "program build/nuttx verify reset exit"