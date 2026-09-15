#define VGA
#include <drivers.h>

#define PRINT
#define SYS_TIME
#define LOG
#include <func.h>

void _main(void) {
    vga_init();
    
    klog("Initializing kernel...");

    while (1) {
        __asm__ volatile("hlt");
    }
}