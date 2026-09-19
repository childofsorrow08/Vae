global idt_flush
global irq1_stub

extern keyboard_interrupt_handler

section .text

idt_flush:
    mov eax, [esp + 4]
    lidt [eax]
    ret

irq1_stub:
    pusha

    call keyboard_interrupt_handler

    mov al, 0x20
    out 0x20, al

    popa
    iretd

section .note.GNU-stack noalloc noexec nowrite progbits