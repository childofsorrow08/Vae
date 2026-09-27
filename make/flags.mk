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
    -g

32_ARCH_CFLAGS := -m32 -Dx32
32_UEFI_ARCH_ASFLAGS := -f win32
32_MULTIBOOT_ARCH_ASFLAGS := -f elf32

64_ARCH_CFLAGS := -m64 -Dx64
64_UEFI_ARCH_ASFLAGS := -f win64
64_MULTIBOOT_ARCH_ASFLAGS := -f elf64
