add_custom_target(bin ALL
    DEPENDS kernel
    COMMAND ${CMAKE_OBJCOPY} -O binary $<TARGET_FILE:kernel> ${CMAKE_BINARY_DIR}/kernel.bin
    COMMENT "Generating raw binary kernel.bin..."
)