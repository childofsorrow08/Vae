[BITS 32]
section .text
    global paging_init

    extern page_pml4
    extern page_pdpt
    extern page_pd

    paging_init:
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