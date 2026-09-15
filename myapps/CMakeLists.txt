cmake_minimum_required(VERSION 3.13)
set(NUTTX_EXPORT_DIR "${CMAKE_CURRENT_SOURCE_DIR}/nuttx-export-0.0.0")
set(CMAKE_TOOLCHAIN_FILE "${NUTTX_EXPORT_DIR}/scripts/toolchain.cmake"
    CACHE FILEPATH "Toolchain file")
project(MyAddon C CXX)

add_subdirectory(src)