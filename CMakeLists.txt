# --------------------------- CMAKE ---------------------------
cmake_minimum_required(VERSION 3.25)

include(cmake/options/arch.cmake)
include(cmake/options/targets.cmake)

include(cmake/prerequisites.cmake)
include(cmake/flags.cmake)
project(kernel C ASM_NASM)

# --------------------------- KERNEL ---------------------------

include(cmake/source.cmake)

add_executable(kernel
    ${ROOT_FOLDER_SOURCES}
    ${BOOT_FOLDER_SOURCES}
)

set_target_properties(kernel PROPERTIES
    LINK_FLAGS "-T ${CMAKE_CURRENT_SOURCE_DIR}/cmake/ld/linker.ld -nostdlib"
    OUTPUT_NAME "kernel.elf"
)

# --------------------------- BUILDING ---------------------------

include(cmake/compile_info.cmake)
include(cmake/compile_definitions.cmake)

if(BUILDISO)
    include(cmake/targets/iso.cmake)
endif()

if(BUILDIMG)
    include(cmake/targets/img.cmake)
endif()

if(BUILDBIN)
    include(cmake/targets/bin.cmake)
endif()