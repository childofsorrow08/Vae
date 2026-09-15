#include <drivers.h>

#define PRINT
#define SYS_TIME
#define LOG
#include <func.h>

void _main(void) {
    /*
     * don't works with multiboot2
     * because i using framebuffer now
     *
     * vga_init();
     * klog("Initializing kernel...");
     */
    

    while (1) {
        __asm__ volatile("hlt");
    }
}