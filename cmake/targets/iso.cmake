add_custom_target(iso ALL
    DEPENDS kernel
    COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_BINARY_DIR}/isodir/boot/grub
    COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_FILE:kernel> ${CMAKE_BINARY_DIR}/isodir/boot/kernel.elf
    COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_SOURCE_DIR}/cmake/grub/grub.cfg ${CMAKE_BINARY_DIR}/isodir/boot/grub/grub.cfg
    COMMAND grub-mkrescue -o ${CMAKE_BINARY_DIR}/kernel.iso ${CMAKE_BINARY_DIR}/isodir --quiet
    COMMENT "Packaging kernel into bootable ISO..."
)