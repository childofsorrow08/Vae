ENTRY(_uefi_start32)

SECTIONS
{
    . = 1M;

    .boot : { *(.uefi_boot) }
    .text : { *(.text) }
    .rodata : { *(.rodata) }
    .data : { *(.data) }
    .bss : { *(COMMON) *(.bss) }
}
