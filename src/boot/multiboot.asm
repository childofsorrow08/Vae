[BITS 32]
section .multiboot
    align 8
    header_start:
        dd 0xE85250D6                                       ; multiboot2 magic number
        dd 0                                                ; 0 = 32 bit
        dd header_end - header_start                        ; header length
        dd -(0xE85250D6 + 0 + (header_end - header_start))  ; checksum

        ; Framebuffer request tag
        align 8
        dw 5                         ; framebuffer request
        dw 0                         ; required
        dd 20                        ; tag size
        dd 0                         ; width
        dd 0                         ; height
        dd 0                         ; BPP

        ; End tag
        align 8
        dw 0
        dw 0
        dd 8
    header_end:

section .note.GNU-stack noalloc noexec nowrite progbits
