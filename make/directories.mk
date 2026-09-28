MAKE_CFG_DIR := $(ROOT_DIR)/make
TARGETS_DIR := $(MAKE_CFG_DIR)/targets

32_BUILD_DIR := $(ROOT_DIR)/build32
64_BUILD_DIR := $(ROOT_DIR)/build64
32_BINARY_DIR := $(ROOT_DIR)/binary32
64_BINARY_DIR := $(ROOT_DIR)/binary64
SRC_DIR := $(ROOT_DIR)/src

UEFI_LINKER := $(MAKE_CFG_DIR)/linker/linker_uefi.ld
MULTIBOOT_LINKER := $(MAKE_CFG_DIR)/linker/linker_multiboot.ld

X32_ISO_IMG := $(32_BINARY_DIR)/kernel.iso
X32_ISO_DIR := $(32_BUILD_DIR)/iso
GRUB_CFG := $(MAKE_CFG_DIR)/grub/grub.cfg
