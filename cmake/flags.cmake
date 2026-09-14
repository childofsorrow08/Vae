set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -m64 -ffreestanding -fno-pie -fno-stack-protector -fno-builtin -nostdlib -Wall -Wextra")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -no-pie -nostdlib")
set(CMAKE_ASM_FLAGS "-f elf64")
set(CMAKE_ASM_NASM_OBJECT_FORMAT elf64)