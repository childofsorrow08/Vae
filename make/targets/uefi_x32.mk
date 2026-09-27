uefi32: ARCH := x32
uefi32: $(UEFI_ASM_SOURCES)
uefi32: $(UEFI_C_SOURCES)
uefi32: $(COMMON_NASM_SOURCES)
uefi32: $(COMMON_C_SOURCES)

uefi32:
	@echo "[INFO] Building UEFI x32 application"
	@mkdir -p $(32_BUILD_DIR)

	@$(AS) 	$(COMMON_ASFLAGS) 						\
			$(32_MULTIBOOT_ARCH_ASFLAGS) 			\
			$(METADATA_FLAGS) 						\
			$(UEFI_ASM_SOURCES) 					\
			-o $(32_BUILD_DIR)/asm_kernel.o

	@$(CC) 	$(COMMON_CFLAGS) 						\
			$(32_ARCH_CFLAGS) 						\
			-c $(COMMON_C_SOURCES) 					\
			-o $(32_BUILD_DIR)/c_kernel.o

	@$(CC) 	-m32 -nostdlib -T $(UEFI_LINKER)		\
	        $(32_BUILD_DIR)/asm_kernel.o 			\
	        $(32_BUILD_DIR)/c_kernel.o 				\
	        -o $(32_BUILD_DIR)/not_yet_kernel.elf

	@objcopy -j .text -j .sdata -j .data -j .rodata -j .bss \
		--set-section-flags .bss=alloc,load,contents \
		-O pei-i386 $(32_BUILD_DIR)/not_yet_kernel.elf $(32_BUILD_DIR)/kernel.efi

	rm -rf $(32_BINARY_DIR)
	@mkdir -p $(32_BINARY_DIR)
	@mv $(32_BUILD_DIR)/kernel.efi $(32_BINARY_DIR)/kernel.efi
