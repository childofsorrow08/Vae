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
    
    extern paging_init     
    extern stack_top
    
%ifidn ARCH_NAME, "i386"

    extern gdt32
    extern gdt32.pointer

%elifidn ARCH_NAME, "x86_64"

    extern gdt64
    extern gdt64.pointer
    extern gdt64.code_selector
    extern long_jump

%endif

_start32:
    cli

    lgdt [gdt32.pointer]

    mov ax, 0x10
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax

    jmp 0x08:.reload_cs

    .reload_cs:
    mov esp, stack_top

    push ebx

%ifidn ARCH_NAME, "i386"

        call main

%elifidn ARCH_NAME, "x86_64"

        call paging_init
        call long_jump

        lgdt [gdt64.pointer]
        jmp gdt64.code_selector:_start64

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