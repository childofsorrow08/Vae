iso32: $(32_BINARY_DIR)/kernel.elf
	@echo "[INFO] Building x32 ISO image"

	@mkdir -p $(X32_ISO_DIR)/boot/grub

	@cp $(32_BINARY_DIR)/kernel.elf $(X32_ISO_DIR)/boot/kernel.elf
	cp $(GRUB_CFG) $(X32_ISO_DIR)/boot/grub/grub.cfg

	@grub-mkrescue -o $(X32_ISO_IMG) $(X32_ISO_DIR) 2>/dev/null
	@echo "[INFO] ISO created at: $(X32_ISO_IMG)"
