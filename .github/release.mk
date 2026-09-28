release: iso32 elf32 efi32 				\
										\
         $(32_BINARY_DIR)/kernel.iso 	\
         $(32_BINARY_DIR)/kernel.elf 	\
         $(32_BINARY_DIR)/kernel.efi

	@mkdir -p $(ROOT_DIR)/build

	@mv $(32_BINARY_DIR)/kernel.iso \
	    $(ROOT_DIR)/build/kernel_x32.iso

	@mv $(32_BINARY_DIR)/kernel.elf \
	    $(ROOT_DIR)/build/kernel_x32.elf

	@mv $(32_BINARY_DIR)/kernel.efi \
	    $(ROOT_DIR)/build/kernel_x32.efi
