; There's a funny story about this:
; When I started writing a minimal keyboard driver and ran into a problem
; with the `hlt` instruction at the end of the kernel loop -
; since I hadn’t implemented interrupts yet—the kernel essentially freezed
; after the `hlt` was executed. When I tried to implement interrupts,
; no matter how hard I tried, the kernel would freeze, and after spending almost
; the entire night working on interrupts, I realized that I had forgotten to
; implement the 32-bit GDT, and because of its absence, this problem existed

; i fucking hate myself,
; don't know why else Assembly and C are my
; favorite programming languages

section .rodata

; =====================================================================
;                   32-BIT GLOBAL DESCRIPTOR TABLE (GDT)
; =====================================================================
%ifidn ARCH_NAME, "i386"

    global _i386_gdt
    global _i386_gdt.pointer

    _i386_gdt:
        ; 0x00: null descriptor
        dq 0

        ; 0x08 - kernel code, 32-bit
        dw 0xFFFF
        dw 0x0000
        db 0x00
        db 10011010b
        db 11001111b
        db 0x00

        ; 0x10 - kernel data
        dw 0xFFFF
        dw 0x0000
        db 0x00
        db 10010010b
        db 11001111b
        db 0x00

    _i386_gdt_end:

    ; pointer structure used by the 'lgdt' instruction
    _i386_gdt.pointer:
        dw _i386_gdt_end - _i386_gdt - 1
        dd _i386_gdt

; =====================================================================
;                   64-BIT GLOBAL DESCRIPTOR TABLE (GDT)
; =====================================================================
%elifidn ARCH_NAME, "x86_64"

    global _x86_64_gdt
    global _x86_64_gdt.pointer
    global _x86_64_gdt.code_selector

    _x86_64_gdt:
        ; 0x00: Null Descriptor
        dq 0

    ; 0x08: 64-bit Kernel Code Descriptor
    ; In long mode, base and limit are largely ignored, but attributes matter.
    .code_selector equ $ - _x86_64_gdt
        dq (1 << 43) | (1 << 44) | (1 << 47) | (1 << 53)
        ; Bit 43 (Executable): 1
        ; Bit 44 (Descriptor type): 1
        ; Bit 47 (Present): 1
        ; Bit 53 (L - Long Mode): 1

    .pointer:
        dw $ - _x86_64_gdt - 1     ; GDT Limit (Size - 1)
        dq _x86_64_gdt             ; 64-bit Base address of the GDT

%endif

section .note.GNU-stack noalloc noexec nowrite progbits
