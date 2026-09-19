if(ARCH STREQUAL "i386")
    set(BOOT_FOLDER_SOURCES
        "${CMAKE_SOURCE_DIR}/src/boot/multiboot.asm"
        "${CMAKE_SOURCE_DIR}/src/boot/paging.asm"
        "${CMAKE_SOURCE_DIR}/src/boot/bss.asm"
        "${CMAKE_SOURCE_DIR}/src/boot/gdt32.asm"
    )
elseif(ARCH STREQUAL "x86_64")
    set(BOOT_FOLDER_SOURCES
        "${CMAKE_SOURCE_DIR}/src/boot/long_jump.asm"
        "${CMAKE_SOURCE_DIR}/src/boot/multiboot.asm"
        "${CMAKE_SOURCE_DIR}/src/boot/paging.asm"
        "${CMAKE_SOURCE_DIR}/src/boot/bss.asm"
        "${CMAKE_SOURCE_DIR}/src/boot/gdt.asm"
    )
endif()