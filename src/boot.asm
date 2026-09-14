[BITS 32]

section .multiboot
align 4
    dd 0x1BADB002                   ; Magic number
    dd 0x00000003                   ; Flags
    dd -(0x1BADB002 + 0x00000003)   ; Checksum

section .text
    global _start
    extern main                      

    _start:
        cli                      ; CLI - Clear Interrupt Flag
        mov esp, stack_top
        call main                

    .hang:
        hlt
        jmp .hang

    section .bss
        align 16
    stack_bottom:
        resb 16384
    stack_top: