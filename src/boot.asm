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
        cli                      
        mov esp, stack_top

        call setup_page_tables
        call enable_long_mode

        lgdt [gdt64.pointer]
        jmp gdt64.code_selector:long_mode_start

    setup_page_tables:
        mov eax, page_pdpt
        or eax, 0b11
        mov [page_pml4], eax

        mov eax, page_pd
        or eax, 0b11
        mov [page_pdpt], eax

        xor ecx, ecx
    .map_loop:
        mov eax, 0x200000
        mul ecx
        or eax, 0b10000011
        mov [page_pd + ecx * 8], eax
        inc ecx
        cmp ecx, 512
        jl .map_loop
        ret

    enable_long_mode:
        mov eax, cr4
        or eax, 1 << 5
        mov cr4, eax

        mov eax, page_pml4
        mov cr3, eax

        mov ecx, 0xC0000080
        rdmsr
        or eax, 1 << 8
        wrmsr

        mov eax, cr0
        or eax, (1 << 31) | (1 << 0)
        mov cr0, eax
        ret

section .rodata
    gdt64:
        dq 0
    .code_selector equ $ - gdt64
        dq (1 << 43) | (1 << 44) | (1 << 47) | (1 << 53)
    .pointer:
        dw $ - gdt64 - 1
        dq gdt64

[BITS 64]
    long_mode_start:
        mov ax, 0
        mov ds, ax
        mov es, ax
        mov fs, ax
        mov gs, ax
        mov ss, ax

        call main

    .hang:
        cli
        hlt
        jmp .hang

section .bss
    align 4096
page_pml4: resb 4096
page_pdpt: resb 4096
page_pd:   resb 4096
    align 16
stack_bottom:
    resb 16384
stack_top: