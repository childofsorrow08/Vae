global inb

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