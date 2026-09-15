section .bss
    global page_pml4
    global page_pdpt
    global page_pd
    global stack_top

    align 4096
page_pml4: resb 4096
page_pdpt: resb 4096
page_pd:   resb 4096

    align 16
stack_bottom:
    resb 16384
stack_top:

section .note.GNU-stack noalloc noexec nowrite progbits