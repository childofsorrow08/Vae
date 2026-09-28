$(32_BUILD_DIR)/%.o: %.c
	@mkdir -p $(dir $@)
	@echo "[INFO] Compiling: $<"
	@$(CC)  $(COMMON_CFLAGS)                        \
	        $(32_ARCH_CFLAGS)                       \
	        -c $< -o $@
