UEFI_ASM_OBJS  = 					\
	$(patsubst %.asm, 				\
	$(32_BUILD_DIR)/%.o, 			\
	$(UEFI_ASM_SOURCES) 			\
	$(COMMON_NASM_SOURCES))

UEFI_C_OBJS    = 					\
	$(patsubst %.c,   				\
	$(32_BUILD_DIR)/%.o, 			\
	$(UEFI_C_SOURCES) 				\
	$(COMMON_C_SOURCES))

UEFI_ALL_OBJS  = 					\
	$(UEFI_ASM_OBJS)				\
	$(UEFI_C_OBJS)

MULTIBOOT_ASM_OBJS  =					\
	$(patsubst %.asm, 					\
	$(32_BUILD_DIR)/%.o, 				\
	$(MULTIBOOT_ASM_SOURCES) 			\
	$(COMMON_NASM_SOURCES))

MULTIBOOT_C_OBJS    =					\
	$(patsubst %.c,   					\
	$(32_BUILD_DIR)/%.o, 				\
	$(MULTIBOOT_C_SOURCES) 				\
	$(COMMON_C_SOURCES))

MULTIBOOT_ALL_OBJS  = 					\
	$(MULTIBOOT_ASM_OBJS)				\
	$(MULTIBOOT_C_OBJS)
