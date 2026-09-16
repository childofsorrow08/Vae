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
    extern gdt64
    extern gdt64.pointer
    extern gdt64.code_selector
    extern long_jump
%endif

    _start32:
        cli                      
        mov esp, stack_top

        ; multiboot passes a pointer to the info to EBX
        ; we'll pass it to _main
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