C_SOURCES :=			\

ASM_SOURCES := 			\

32_C_OBJS   := $(patsubst src/%.c, $(32_BUILD_DIR)/%.o, $(C_SOURCES))
32_ASM_OBJS := $(patsubst src/%.asm, $(32_BUILD_DIR)/%.o, $(ASM_SOURCES))
32_OBJECTS  := $(32_ASM_OBJS) $(32_C_OBJS)

64_C_OBJS   := $(patsubst src/%.c, $(64_BUILD_DIR)/%.o, $(C_SOURCES))
64_ASM_OBJS := $(patsubst src/%.asm, $(64_BUILD_DIR)/%.o, $(ASM_SOURCES))
64_OBJECTS  := $(64_ASM_OBJS) $(64_C_OBJS)
