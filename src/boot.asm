[BITS 32]

; multiboot header can be found in:
; src/boot/multiboot.asm
; just like all other boot functions

section .text
    global _start32

    extern _main
    extern paging_init     
    extern long_jump
    extern gdt64
    extern gdt64.pointer
    extern gdt64.code_selector
    extern stack_top 

    _start32:
        cli                      
        mov esp, stack_top

        ; multiboot passes a pointer to the info to EBX
        ; we'll pass it to _main
        push ebx 

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

        call _main

    .hang:
        cli
        hlt
        jmp .hang

section .note.GNU-stack noalloc noexec nowrite progbits

; ------------------------------------------------------------------------

%if 0
    ; The old version of the code as of September 15, 2026, 
    ; when Multiboot 1 was still in use here
    ; I don't know why I'm keeping this

    ; A lot of things haven't changed, 
    ; but I'd still like to keep it that way, 
    ; at least for a while
[BITS 32]
section .multiboot                  ; Multiboot 1
align 4
    dd 0x1BADB002                   ; Magic number
    dd 0x00000003                   ; Flags
    dd -(0x1BADB002 + 0x00000003)   ; Checksum

section .text
    global _start32

    extern _main
    extern paging_init     
    extern long_jump
    extern gdt64
    extern gdt64.pointer
    extern gdt64.code_selector
    extern stack_top 

    _start32:
        cli                      
        mov esp, stack_top

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

        call _main

    .hang:
        cli
        hlt
        jmp .hang
%endif