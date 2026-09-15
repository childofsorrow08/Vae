#define VGA
#include <drivers.h>

#define PRINT
#include <func.h>

void _main(void) {
    vga_init();

    while (1) {
        __asm__ volatile("hlt");
    }
}