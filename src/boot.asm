; Copyright (C) 2026 Child of Sorrow
;
; This file is part of VAE kernel.
; VAE kernel is free software: you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation, either version 3 of the License, or
; (at your option) any later version.

[BITS 32]

; multiboot header can be found in:
; src/boot/multiboot.asm
; just like all other boot functions

section .text
    global _start32

    extern main

%ifidn ARCH_NAME, "i386"

    extern _i386_paging_init
    extern _i386_stack_top

    extern _i386_gdt
    extern _i386_gdt.pointer

%elifidn ARCH_NAME, "x86_64"

    extern _x86_64_paging_init
    extern _x86_64_stack_top

    extern _x86_64_gdt
    extern _x86_64_gdt.pointer
    extern _x86_64_gdt.code_selector

    extern long_jump

%endif

_start32:
    cli

%ifidn ARCH_NAME, "i386"
    lgdt [_i386_gdt.pointer]
%elifidn ARCH_NAME, "x86_64"
    lgdt [_x86_64_gdt.pointer]
%endif

    mov ax, 0x10
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax

    jmp 0x08:.reload_cs

    .reload_cs:
%ifidn ARCH_NAME, "i386"
    mov esp, _i386_stack_top
%elifidn ARCH_NAME, "x86_64"
    mov esp, _x86_64_stack_top
%endif

    push ebx

%ifidn ARCH_NAME, "i386"

        call _i386_paging_init
        call main

%elifidn ARCH_NAME, "x86_64"

        call _x86_64_paging_init
        call long_jump

        lgdt [_x86_64_gdt.pointer]
        jmp _x86_64_gdt.code_selector:_start64

[BITS 64]
    _start64:
        mov ax, 0
        mov ds, ax
        mov es, ax
        mov fs, ax
        mov gs, ax
        mov ss, ax

        ; pop the pointer to “multiboot info” off the stack
        pop rdi

        call main
%endif

    .hang:
        cli
        hlt
        jmp .hang

section .note.GNU-stack noalloc noexec nowrite progbits
