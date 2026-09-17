[BITS 32]
section .multiboot
align 8
    header_start:
        dd 0xE85250D6                                       ; Multiboot2 magic number
        dd 0                                                ; 0 = 32 bit
        dd header_end - header_start                        ; Header length
        dd -(0xE85250D6 + 0 + (header_end - header_start))  ; Checksum

        ; Framebuffer request tag
        align 8
        dw 5                         ; Framebuffer request
        dw 0                         ; Required
        dd 20                        ; Tag size
        dd 0                         ; Width
        dd 0                         ; Height
        dd 0                         ; BPP

        ; End tag
        align 8
        dw 0
        dw 0
        dd 8
    header_end:

section .note.GNU-stack noalloc noexec nowrite progbits