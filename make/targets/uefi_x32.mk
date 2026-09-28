efi32: ARCH := x32
efi32: $(32_BINARY_DIR)/kernel.efi

$(32_BINARY_DIR)/kernel.efi: $(32_BUILD_DIR)/uefi_not_yet_kernel.elf
	@echo "[INFO] Building x32 .efi binary"
	@mkdir -p $(32_BINARY_DIR)
	@objcopy -j .text -j .sdata -j .data -j .rodata -j .bss \
		--set-section-flags .bss=alloc,load,contents \
		-O pei-i386 $< $@

$(32_BUILD_DIR)/uefi_not_yet_kernel.elf: $(UEFI_ALL_OBJS)
	@echo "[INFO] Linking x32 .efi binary"
	@mkdir -p $(32_BUILD_DIR)
	@$(CC)  -m32 -nostdlib -T $(UEFI_LINKER)        \
	        $(UEFI_ALL_OBJS)                        \
	        -o $@
