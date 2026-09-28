COMMON_NASM_SOURCES :=		\
	# none

COMMON_C_SOURCES	:=		\
	$(SRC_DIR)/kernel.c

UEFI_ASM_SOURCES :=			\
	$(SRC_DIR)/uefi_boot.asm

UEFI_C_SOURCES :=		\
	# none

MULTIBOOT_ASM_SOURCES :=					\
	$(SRC_DIR)/multiboot.asm				\
	$(SRC_DIR)/boot/multiboot_header.asm

MULTIBOOT_C_SOURCES :=		\
	# none
