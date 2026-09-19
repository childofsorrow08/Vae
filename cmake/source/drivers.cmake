set(DRIVERS_FOLDER_SOURCES
    "${CMAKE_SOURCE_DIR}/src/drivers/framebuffer.c"
    "${CMAKE_SOURCE_DIR}/src/drivers/port.asm"
    "${CMAKE_SOURCE_DIR}/src/drivers/terminal.c"
    "${CMAKE_SOURCE_DIR}/src/drivers/keyboard.c"

    "${CMAKE_SOURCE_DIR}/src/drivers/idt.asm"
    "${CMAKE_SOURCE_DIR}/src/drivers/idt.c"
    "${CMAKE_SOURCE_DIR}/src/drivers/pic.c"
)