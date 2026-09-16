add_custom_target(img ALL
    DEPENDS kernel
    COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_BINARY_DIR}/imgdir
    COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_FILE:kernel> ${CMAKE_BINARY_DIR}/imgdir/kernel.elf
    COMMAND dd if=/dev/zero of=${CMAKE_BINARY_DIR}/kernel.img bs=512 count=2880 --quiet
    COMMAND mkfs.fat -F 12 ${CMAKE_BINARY_DIR}/kernel.img >/dev/null 2>&1 || true
    COMMENT "Packaging kernel into bootable IMG..."
)