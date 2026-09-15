cmake_minimum_required(VERSION 3.25)

include(cmake/flags.cmake)
include(cmake/prerequisites.cmake)
project(kernel C ASM_NASM)

add_executable(kernel 
    # root
    "${CMAKE_SOURCE_DIR}/src/boot/multiboot.asm"
    "${CMAKE_SOURCE_DIR}/src/boot.asm"
    "${CMAKE_SOURCE_DIR}/src/kernel.c"

    # boot
    "${CMAKE_SOURCE_DIR}/src/boot/bss.asm"
    "${CMAKE_SOURCE_DIR}/src/boot/gdt.asm"
    "${CMAKE_SOURCE_DIR}/src/boot/long_jump.asm"
    "${CMAKE_SOURCE_DIR}/src/boot/paging.asm"

    # drivers
    "${CMAKE_SOURCE_DIR}/src/drivers/port.c"

    # functions
    "${CMAKE_SOURCE_DIR}/src/func/sys_time.c"
    

    # deprecated because of framebuffer and multiboot2
    #"${CMAKE_SOURCE_DIR}/src/drivers/vga.c"
    #"${CMAKE_SOURCE_DIR}/src/func/print.c"
    #"${CMAKE_SOURCE_DIR}/src/func/klog.c"
)

target_include_directories(kernel PRIVATE
    "${CMAKE_SOURCE_DIR}/src/include"
)

set_target_properties(kernel PROPERTIES
    LINK_FLAGS "-T ${CMAKE_CURRENT_SOURCE_DIR}/linker.ld -nostdlib"
    OUTPUT_NAME "kernel.elf"
)

include(cmake/iso.cmake)