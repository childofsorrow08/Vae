; I really hate the fact that I used AI at first to write a lot of stuff
; Of course, I try to understand what I wrote and rewrite it bit by bit
; so it’s written properly, but I’m such a dumbass because I used it in the first place

[BITS 32]
section .text

; =====================================================================
;                   32-BIT ARCHITECTURE (i386) PAGING
; =====================================================================
%ifidn ARCH_NAME, "i386"
    global _i386_paging_init

    extern _i386_page_directory

    _i386_paging_init:
        mov edi, _i386_page_directory   ; set up a flat identity mapping for the first 4GB of memory
        xor ecx, ecx                    ; using 4MB large pages

    .map_loop:
        mov eax, ecx                    ; multiply index by 4MB (4194304 bytes)
        shl eax, 22                     ; to get physical address

        ; flags:
        ; bit 0 (Present) = 1
        ; bit 1 (Read/Write) = 1
        ; bit 7 (Page Size, 4MB) = 1
        ; 0x83  (0b10000011)
        or eax, 0x00000083

        mov [edi + ecx * 4], eax        ; each entry in the page directory is 4 bytes

        inc ecx
        cmp ecx, 1024                   ; map all 1024 entries (1024 * 4MB = 4GB total)
        jl .map_loop

        ; enable Page Size Extension in CR4 register (Bit 4 = 1)
        mov eax, cr4
        or eax, 0x10
        mov cr4, eax

        ; load the physical address of the page directory into CR3 register
        mov eax, _i386_page_directory
        mov cr3, eax

        ; enable Paging by setting the PG flag (Bit 31) in CR0 register
        mov eax, cr0
        or eax, 0x80000000
        mov cr0, eax

        ret

; =====================================================================
;                   64-BIT ARCHITECTURE (x86_64) PAGING
; =====================================================================
%elifidn ARCH_NAME, "x86_64"
    global _x86_64_paging_init

    extern _x86_64_page_pml4
    extern _x86_64_page_pdpt
    extern _x86_64_page_pd

    _x86_64_paging_init:
        ; link PML4 to PDPT (first entry)
        ; flags: 0b11 -> Present (1) + Read/Write (1)
        mov eax, _x86_64_page_pdpt
        or eax, 0b11
        mov [_x86_64_page_pml4], eax

        ; link PDPT to Page Directory (first entry)
        mov eax, _x86_64_page_pd
        or eax, 0b11
        mov [_x86_64_page_pdpt], eax

        ; map the first 1GB of memory using 2MB large pages
        xor ecx, ecx
    .map_loop:
        mov eax, 0x200000   ; 2MB size per page (2097152 bytes)
        mul ecx             ; multiply by current loop index

        ; flags:
        ; bit 0 (Present) = 1
        ; bit 1 (Read/Write) = 1
        ; bit 7 (Page Size, 4MB) = 1
        ; 0x83  (0b10000011)
        or eax, 0b10000011

        ; in 64-bit page tables, each entry is 8 bytes
        mov [_x86_64_page_pd + ecx * 8], eax


        inc ecx
        cmp ecx, 512        ; 512 entries * 2MB = 1GB mapped
        jl .map_loop

        ret
%endif

section .note.GNU-stack noalloc noexec nowrite progbits
