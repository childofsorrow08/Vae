WEB_KERNEL_DIR := $(ROOT_DIR)/web/kernel

webkernel: $(32_BINARY_DIR)/kernel.iso
	@mkdir -p $(WEB_KERNEL_DIR)
	@mv $(32_BINARY_DIR)/kernel.iso $(WEB_KERNEL_DIR)/kernel.iso
