global inb
global outb

section .text
    inb:
    %ifidn ARCH_NAME, "i386"
        mov dx, [esp + 4]
        in al, dx
        ret
    %elifidn ARCH_NAME, "x86_64"
        mov dx, di
        in al, dx
        ret
    %endif

    outb:
    %ifidn ARCH_NAME, "i386"
        mov dx, [esp + 4]
        mov al, [esp + 8]
        out dx, al
        ret
    %elifidn ARCH_NAME, "x86_64"
        mov dx, di
        mov al, sil
        out dx, al
        ret
    %endif