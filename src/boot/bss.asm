section .bss

; =====================================================================
;                   32-BIT BSS SECTION (i386)
; =====================================================================
%ifidn ARCH_NAME, "i386"
    global _i386_page_directory
    global _i386_stack_top

    ; this ensures the page directory starts
    ; on a 4KB page boundary
    align 4096

    ; this reserves 4KB of uninitialized memory
    _i386_page_directory: resb 4096

    ; aligns the stack to a 16-byte boundary
    ; required by the System V ABI
    align 16

    ; in x86 architectures, the stack grows downwards
    stack_bottom:
        resb 16384      ; reserve 16 KB of memory for the kernel stack
    _i386_stack_top:    ; points to the top of the stack
                        ; initial ESP value

; =====================================================================
;                   64-BIT BSS SECTION (x86_64)
; =====================================================================
%elifidn ARCH_NAME, "x86_64"
    global _x86_64_page_pml4
    global _x86_64_page_pdpt
    global _x86_64_page_pd
    global _x86_64_stack_top

    ; 4-Level Page Table Structures
    align 4096      ; page tables must be strictly 4096-byte
                    ; CPU expects table base addresses to be page-aligned

    _x86_64_page_pml4: resb 4096    ; Page Map Level 4
    _x86_64_page_pdpt: resb 4096    ; Page Directory Pointer Table
    _x86_64_page_pd:   resb 4096    ; Page Directory

    align 16    ; 16-byte alignment is mandatory
                ; for 64-bit systems to support

    stack_bottom:
        resb 16384          ; reserve 16 KB of stack space
    _x86_64_stack_top:      ; initial RSP value

%endif

section .note.GNU-stack noalloc noexec nowrite progbits
