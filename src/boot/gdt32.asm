[BITS 32]

section .rodata

global gdt32
global gdt32.pointer

gdt32:
    ; Null descriptor
    dq 0

    ; 0x08 - kernel code, 32-bit
    dw 0xFFFF
    dw 0x0000
    db 0x00
    db 10011010b
    db 11001111b
    db 0x00

    ; 0x10 - kernel data
    dw 0xFFFF
    dw 0x0000
    db 0x00
    db 10010010b
    db 11001111b
    db 0x00

gdt32_end:

gdt32.pointer:
    dw gdt32_end - gdt32 - 1
    dd gdt32

section .note.GNU-stack noalloc noexec nowrite progbits