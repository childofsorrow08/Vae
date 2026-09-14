cmake_minimum_required(VERSION 3.25)

include(cmake/flags.cmake)

include(cmake/prerequisites.cmake)
project(kernel C ASM_NASM)

add_executable(kernel 
    "${CMAKE_SOURCE_DIR}/src/boot.nasm"
    "${CMAKE_SOURCE_DIR}/src/kernel.c"
)

set_target_properties(kernel PROPERTIES
    LINK_FLAGS "-T ${CMAKE_CURRENT_SOURCE_DIR}/linker.ld -nostdlib"
    OUTPUT_NAME "kernel.elf"
)