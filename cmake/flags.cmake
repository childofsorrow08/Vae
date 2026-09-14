set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -m32 -ffreestanding -fno-pie -fno-stack-protector -fno-builtin -nostdlib -Wall -Wextra")
set(CMAKE_ASM_FLAGS "-f elf64")

set_source_files_properties(src/boot.asm PROPERTIES COMPILE_FLAGS "-f elf32")