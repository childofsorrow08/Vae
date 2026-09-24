; This file needed only for x86_64 build
; of this kernel, cuz it's literally jump to
; x86_64 mode

[BITS 32]

section .text
    global long_jump

    extern _x86_64_page_pml4

    long_jump:
        ; Enable Physical Address Extension in CR4
        ; PAE is mandatory for 64-bit paging
        ; Bit 5 = 1 (1 << 5)
        mov eax, cr4
        or eax, 1 << 5
        mov cr4, eax

        ; Load the base address of the PML4 table into CR3
        ; CR3 points to the top-level 4-level page table hierarchy (PML4)
        mov eax, _x86_64_page_pml4
        mov cr3, eax

        ; Enable Long Mode (IA32_EFER MSR, bit 8)
        ; We use Model Specific Registers (MSR) to activate IA-32e mode
        ; 0xC0000080 is the address of the EFER
        mov ecx, 0xC0000080
        rdmsr
        or eax, 1 << 8
        wrmsr

        ; Enable Paging and Protection in CR0
        ; - Bit 31 (Paging): Enables virtual memory/paging.
        ; - Bit 0  Enables Protected Mode (if not already).
        ; Enabling PG automatically switches the CPU into Long Mode
        mov eax, cr0
        or eax, (1 << 31) | (1 << 0)
        mov cr0, eax
        ret

section .note.GNU-stack noalloc noexec nowrite progbits
