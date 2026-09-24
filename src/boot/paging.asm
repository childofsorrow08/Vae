[BITS 32]
section .text

%ifidn ARCH_NAME, "i386"
    global _i386_paging_init

    extern _i386_page_directory

    _i386_paging_init:
        mov edi, _i386_page_directory
        xor ecx, ecx

    .map_loop:
        mov eax, ecx
        shl eax, 22

        ; flags:
        ; bit 0 (Present) = 1
        ; bit 1 (Read/Write) = 1
        ; bit 7 (Page Size, 4MB) = 1
        ; 0x83  (0b10000011)
        or eax, 0x00000083

        mov [edi + ecx * 4], eax

        inc ecx
        cmp ecx, 1024
        jl .map_loop

        mov eax, cr4
        or eax, 0x10
        mov cr4, eax

        mov eax, _i386_page_directory
        mov cr3, eax

        mov eax, cr0
        or eax, 0x80000000
        mov cr0, eax

        ret

%elifidn ARCH_NAME, "x86_64"
    global _x86_64_paging_init

    extern _x86_64_page_pml4
    extern _x86_64_page_pdpt
    extern _x86_64_page_pd

    _x86_64_paging_init:
        mov eax, _x86_64_page_pdpt
        or eax, 0b11
        mov [_x86_64_page_pml4], eax

        mov eax, _x86_64_page_pd
        or eax, 0b11
        mov [_x86_64_page_pdpt], eax

        xor ecx, ecx
    .map_loop:
        mov eax, 0x200000
        mul ecx
        or eax, 0b10000011
        mov [_x86_64_page_pd + ecx * 8], eax
        inc ecx
        cmp ecx, 512
        jl .map_loop
        ret
%endif

section .note.GNU-stack noalloc noexec nowrite progbits
