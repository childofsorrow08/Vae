ENTRY(_multiboot_start32)

SECTIONS
{
    . = 1M;

    .multiboot : {
		*(.multiboot_header)
		*(.multiboot_start)
	}

    .text : { *(.text) }
    .rodata : { *(.rodata) }
    .data : { *(.data) }
    .bss : { *(COMMON) *(.bss) }
}
