# MULTIBOOT_C_SOURCES :=

# MULTIBOOT_ASM_SOURCES :=


# 32_MB_C_OBJS   := $(patsubst src/multiboot/%.c, $(32_BUILD_DIR)/multiboot/%.o, $(MULTIBOOT_C_SOURCES))
# 32_MB_ASM_OBJS := $(patsubst src/multiboot/%.asm, $(32_BUILD_DIR)/multiboot/%.o, $(MULTIBOOT_ASM_SOURCES))
# 32_MB_OBJECTS  := $(32_MB_ASM_OBJS) $(32_MB_C_OBJS)

# 64_MB_C_OBJS   := $(patsubst src/multiboot/%.c, $(64_BUILD_DIR)/multiboot/%.o, $(MULTIBOOT_C_SOURCES))
# 64_MB_ASM_OBJS := $(patsubst src/multiboot/%.asm, $(64_BUILD_DIR)/multiboot/%.o, $(MULTIBOOT_ASM_SOURCES))
# 64_MB_OBJECTS  := $(64_MB_ASM_OBJS) $(64_MB_C_OBJS)
