COMMON_CFLAGS := \
    -ffreestanding \
    -fno-builtin \
    -fno-stack-protector \
    -fno-pie \
    -fno-pic \
    -mno-red-zone \
    -Wall \
    -Wextra \
    -Werror \
    -pedantic \
    $(METADATA_FLAGS) # make/definitions.mk

COMMON_ASFLAGS := \
    -F dwarf \
    -g

32_ARCH_CFLAGS := -m32 -Dx32
32_ARCH_ASFLAGS := -f elf32

64_ARCH_CFLAGS := -m64 -Dx64
64_ARCH_ASFLAGS := -f elf64

# Use only this variables
32_CFLAGS  := $(COMMON_CFLAGS) $(32_ARCH_CFLAGS)
64_CFLAGS  := $(COMMON_CFLAGS) $(64_ARCH_CFLAGS)

32_ASFLAGS := $(COMMON_ASFLAGS) $(32_ARCH_ASFLAGS)
64_ASFLAGS := $(COMMON_ASFLAGS) $(64_ARCH_ASFLAGS)
