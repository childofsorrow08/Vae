elf32: ARCH := x32
elf32: $(32_BINARY_DIR)/kernel.elf

$(32_BINARY_DIR)/kernel.elf: $(32_BUILD_DIR)/kernel.elf
	@echo "[INFO] Building x32 .elf binary"
	@mkdir -p $(32_BINARY_DIR)
	@cp $< $@

$(32_BUILD_DIR)/kernel.elf: $(MULTIBOOT_ALL_OBJS)
	@echo "[INFO] Linking x32 .elf binary"
	@mkdir -p $(32_BUILD_DIR)
	@$(CC)  -m32 -nostdlib -T $(MULTIBOOT_LINKER)        	\
	        $(MULTIBOOT_ALL_OBJS)                 		  	\
	        -o $@
