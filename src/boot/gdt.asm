section .rodata
    global gdt64
    global gdt64.pointer
    global gdt64.code_selector

    gdt64:
        dq 0
    .code_selector equ $ - gdt64
        dq (1 << 43) | (1 << 44) | (1 << 47) | (1 << 53)
    .pointer:
        dw $ - gdt64 - 1
        dq gdt64

section .note.GNU-stack noalloc noexec nowrite progbits