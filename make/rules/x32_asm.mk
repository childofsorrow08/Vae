$(32_BUILD_DIR)/%.o: %.asm
	@mkdir -p $(dir $@)
	@echo "[INFO] Assembling: $<"
	@$(AS)  $(COMMON_ASFLAGS)                       \
	        $(32_UEFI_ARCH_ASFLAGS)					\
	        $(METADATA_FLAGS)                       \
	        $< -o $@

$(32_BUILD_DIR)/%.o: %.asm
	@mkdir -p $(dir $@)
	@echo "[INFO] Assembling: $<"
	@$(AS)  $(COMMON_ASFLAGS)                       \
	        $(32_MULTIBOOT_ARCH_ASFLAGS)            \
	        $(METADATA_FLAGS)                       \
	        $< -o $@
