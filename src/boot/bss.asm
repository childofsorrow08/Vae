section .bss

%ifidn ARCH_NAME, "i386"
    global _i386_page_directory
    global _i386_stack_top

    align 4096
    _i386_page_directory: resb 4096

    align 16
    stack_bottom:
        resb 16384
    _i386_stack_top:

%elifidn ARCH_NAME, "x86_64"
    global _x86_64_page_pml4
    global _x86_64_page_pdpt
    global _x86_64_page_pd
    global _x86_64_stack_top

    align 4096
    _x86_64_page_pml4: resb 4096
    _x86_64_page_pdpt: resb 4096
    _x86_64_page_pd:   resb 4096

    align 16
    stack_bottom:
        resb 16384
    _x86_64_stack_top:

%endif

section .note.GNU-stack noalloc noexec nowrite progbits
