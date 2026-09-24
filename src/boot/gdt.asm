section .rodata

%ifidn ARCH_NAME, "i386"

    global _i386_gdt
    global _i386_gdt.pointer

    _i386_gdt:
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

    _i386_gdt_end:

    _i386_gdt.pointer:
        dw _i386_gdt_end - _i386_gdt - 1
        dd _i386_gdt

%elifidn ARCH_NAME, "x86_64"

    global _x86_64_gdt
    global _x86_64_gdt.pointer
    global _x86_64_gdt.code_selector

    _x86_64_gdt:
        dq 0
    .code_selector equ $ - _x86_64_gdt
        dq (1 << 43) | (1 << 44) | (1 << 47) | (1 << 53)
    .pointer:
        dw $ - _x86_64_gdt - 1
        dq _x86_64_gdt

%endif

section .note.GNU-stack noalloc noexec nowrite progbits
