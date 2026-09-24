; This file needed only for x86_64 build
; of this kernel, cuz it's literally jump to
; x86_64 mode

[BITS 32]

section .text
    global long_jump

    extern _x86_64_page_pml4

    long_jump:
        mov eax, cr4
        or eax, 1 << 5
        mov cr4, eax

        mov eax, _x86_64_page_pml4
        mov cr3, eax

        mov ecx, 0xC0000080
        rdmsr
        or eax, 1 << 8
        wrmsr

        mov eax, cr0
        or eax, (1 << 31) | (1 << 0)
        mov cr0, eax
        ret

section .note.GNU-stack noalloc noexec nowrite progbits
