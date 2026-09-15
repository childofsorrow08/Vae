add_custom_target(iso ALL
    DEPENDS kernel
    COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_BINARY_DIR}/isodir/boot/grub
    COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_FILE:kernel> ${CMAKE_BINARY_DIR}/isodir/boot/kernel.elf
    COMMAND ${CMAKE_COMMAND} -E echo "menuentry \"kernel\" {" > ${CMAKE_BINARY_DIR}/isodir/boot/grub/grub.cfg
    COMMAND ${CMAKE_COMMAND} -E echo "    multiboot2 /boot/kernel.elf" >> ${CMAKE_BINARY_DIR}/isodir/boot/grub/grub.cfg
    COMMAND ${CMAKE_COMMAND} -E echo "    boot" >> ${CMAKE_BINARY_DIR}/isodir/boot/grub/grub.cfg
    COMMAND ${CMAKE_COMMAND} -E echo "}" >> ${CMAKE_BINARY_DIR}/isodir/boot/grub/grub.cfg
    COMMAND grub-mkrescue -o ${CMAKE_BINARY_DIR}/kernel.iso ${CMAKE_BINARY_DIR}/isodir --quiet
    COMMENT "Packaging kernel into bootable ISO..."
)