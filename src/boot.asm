; Copyright (C) 2026 Child of Sorrow
;
; This file is part of VAE kernel.
; VAE kernel is free software: you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation, either version 3 of the License, or
; (at your option) any later version.

; I'd like to apologize in advance for the number of comments:
; I realize that most of them aren't necessary or just state the obvious,
; but I'm basically just getting started with assembly language,
; so I want to have these kinds of cheat sheets for myself
;
; Also, some comments help me read the code better
; I'm still not very used to assembly syntax
; Also i hate this shit because i fucking can't
; understand what i have done, i just want to be
; a better programmer
;
; In any case, this is just a learning project for me
;
; Thanks for your understanding

; multiboot header can be found in:
; src/boot/multiboot.asm
; just like all other boot functions

[BITS 32]
section .text
    global _start32

    extern main

; --- CONDITIONAL EXTERNAL DECLARATIONS BASED ON ARCHITECTURE ---
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

; =====================================================================
;                     KERNEL ENTRY POINT (32-bit)
; =====================================================================
_start32:
    ; disable hardware interrupts during initial CPU setup
    cli

    ; load our own GDT, repl
    ; instead of the one provided by GRUB
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

    ; reload the code segment register using a far jump
    ; 0x08 is the kernel code selector in the GDT
    jmp 0x08:.reload_cs

    ; set up the stack pointer (ESP) to point to the
    ; reserved stack space in the .bss section
    .reload_cs:
%ifidn ARCH_NAME, "i386"
    mov esp, _i386_stack_top
%elifidn ARCH_NAME, "x86_64"
    mov esp, _x86_64_stack_top
%endif

    ; save the pointer to the Multiboot info structure
    ; passed by the bootloader in EBX
    push ebx

%ifidn ARCH_NAME, "i386"
        ; --- BRANCH FOR 32-BIT ARCHITECTURE (i386) ---

        ; initialize paging
        ; virtual memory page tables
        call _i386_paging_init

        ; and finally, we can move on
        ; to the kernel itself
        call main

%elifidn ARCH_NAME, "x86_64"
        ; --- BRANCH FOR 64-BIT ARCHITECTURE (x86_64) ---


        call _x86_64_paging_init    ; initialize the 4-level page table hierarchy
        call long_jump              ; transition to 64-bit mode

        ; reload the GDT and perform a far jump to the 64-bit entry point
        lgdt [_x86_64_gdt.pointer]
        jmp _x86_64_gdt.code_selector:_start64

[BITS 64]
    _start64:
        ; in 64-bit mode, segment registers are mostly ignored,
        ; but zeroing them out is a good practice to prevent legacy base offsets
        mov ax, 0
        mov ds, ax
        mov es, ax
        mov fs, ax
        mov gs, ax
        mov ss, ax

        ; pop the multiboot info pointer off the stack
        pop rdi
        ; according to the System V AMD64 ABI,
        ; the first argument to a C function is passed in RDI

        ; and finally, we can move on
        ; to the x64 kernel itself
        call main
%endif

    ; safety hang loop:
    ; if the code somehow ends up here,
    ; it will go into an infinite loop instead
    ; of reading random memory
    .hang:
        cli         ; clear interrupt flag
        hlt         ; halt the CPU until the next interrupt
        jmp .hang   ; loop back in case an interrupt wakes the CPU

section .note.GNU-stack noalloc noexec nowrite progbits
