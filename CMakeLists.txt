cmake_minimum_required(VERSION 3.25)

include(lib/pico-sdk/pico_sdk_init.cmake)

project(karim_flam_trombone C CXX ASM)
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)
pico_sdk_init()

#set(BTSTACK_ROOT ${PICO_SDK_PATH}/lib/btstack)
#
#add_library(pico_btstack_audio_example INTERFACE)
#target_sources(pico_btstack_audio_example INTERFACE
#        ${PICO_BTSTACK_PATH}/src/btstack_audio.c
#        ${CMAKE_CURRENT_LIST_DIR}/btstack_audio_pico.c
#        )

add_executable(karim_flam_trombone
    src/main.cpp
)

set(PICO_DEOPTIMIZED_DEBUG 1)

pico_enable_stdio_usb(karim_flam_trombone 1)

pico_add_extra_outputs(karim_flam_trombone)
target_link_libraries(karim_flam_trombone pico_stdlib)

add_compile_options(-Wall
        -Wno-format          # int != int32_t as far as the compiler is concerned because gcc has int32_t as long int
        -Wno-unused-function # we have some for the docs that aren't called
        -Wno-maybe-uninitialized
        )
