add_executable(my_app hello_main.c)
add_executable(my_appcxx hello_main.cxx test.cxx)
add_executable(lvgldemo lvgldemo.c 
               lv_music/music_app.c lv_music/music_func.c lv_music/music_list.c lv_music/music_res.c)

target_link_options(my_app PRIVATE
    ${LDMODULEFLAGS}
    -e main
    -T${LINKER_SCRIPT}
    -L${NUTTX_EXPORT_DIR}/libs
)

target_link_options(my_appcxx PRIVATE
    ${LDMODULEFLAGS}
    -e main
    -T${LINKER_SCRIPT}
    -L${NUTTX_EXPORT_DIR}/libs
)

target_link_options(lvgldemo PRIVATE
    ${LDMODULEFLAGS}
    -e main
    -T${LINKER_SCRIPT}
    -L${NUTTX_EXPORT_DIR}/libs
)

target_include_directories(lvgldemo PRIVATE
    ${NUTTX_EXPORT_DIR}/include/lvgl
)

function(target_add_symtab target)
    add_custom_command(
        TARGET ${target} POST_BUILD
        COMMAND cat ${NUTTX_EXPORT_DIR}/System.map | sed -e "s/\r//g" > System.map
        COMMAND ${NUTTX_EXPORT_DIR}/scripts/mkdefines.sh System.map "${target}" > defines.ld
        COMMAND ${CMAKE_LINKER}
                ${LDMODULEFLAGS}
                -e main
                -T defines.ld
                -T${LINKER_SCRIPT}
                -L${NUTTX_EXPORT_DIR}/libs
                -o ${target}_tmp ${target}
        COMMAND ${CMAKE_STRIP} --strip-unneeded ${target}_tmp
        COMMAND rm -f ${target}
        COMMAND mv ${target}_tmp ${target}
        VERBATIM
    )
endfunction()

target_add_symtab(my_app)
target_add_symtab(my_appcxx)
target_add_symtab(lvgldemo)