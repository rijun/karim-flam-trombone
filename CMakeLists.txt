cmake_minimum_required(VERSION 3.25)

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)
set(PICO_BOARD pico_w)
set(PICO_EXTRAS_PATH ${CMAKE_CURRENT_LIST_DIR}/lib/pico-extras)
set(BTSTACK_ROOT ${PICO_SDK_PATH}/lib/btstack)
set(BTSTACK_AUDIO_PICO_ROOT lib/btstack-audio-pico)
set(PICO_DEOPTIMIZED_DEBUG 1)

include(pico_sdk_import.cmake)
include(lib/pico-extras/external/pico_extras_import.cmake)

project(karim_flam_trombone C CXX ASM)

# initialize the Raspberry Pi Pico SDK
pico_sdk_init()

# Bluetooth stack setup
add_library(pico_btstack_audio INTERFACE)
target_sources(pico_btstack_audio INTERFACE
        ${PICO_BTSTACK_PATH}/src/btstack_audio.c
        ${BTSTACK_AUDIO_PICO_ROOT}/btstack_audio_pico.c
        )
target_link_libraries(pico_btstack_audio INTERFACE
        hardware_dma
        pico_audio_i2s
        )
target_include_directories(pico_btstack_audio INTERFACE
        ${CMAKE_CURRENT_LIST_DIR}/inc
        )

set(SOURCES
        src/main.cpp
        inc/btstack_config.h
        )
add_executable(karim_flam_trombone ${SOURCES})

# Add pico_stdlib library which aggregates commonly used features
target_link_libraries(karim_flam_trombone
        pico_stdlib
        pico_btstack_ble
        pico_btstack_classic
        pico_btstack_audio
        )

pico_enable_stdio_usb(karim_flam_trombone 1)

add_compile_options(-Wall
        -Wno-format          # int != int32_t as far as the compiler is concerned because gcc has int32_t as long int
        -Wno-unused-function # we have some for the docs that aren't called
        -Wno-maybe-uninitialized
        )