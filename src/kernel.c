#include <stdint.h>

#include <drivers/framebuffer.h>
#include <drivers/terminal.h>
#include <drivers/keyboard.h>
#include <drivers/pic.h>
#include <drivers/idt.h>

#include <helpers/print_build_info.h>

#include <func/input.h>
#include <func/print.h>

char cmd_buffer[64];

void main(uint32_t mb_info_addr) {
    // framebuffer init
    fb_init(mb_info_addr);

    // initialize PIC and IDT hardware interrupts
    // remap the PIC vectors to 32–47 
    pic_remap(0x20, 0x28); 
    idt_init();

    __asm__ volatile("sti");
    
    #if defined(BUILD_DATE) &           \
        defined(C_COMPILER_INFO) &      \
        defined(NASM_COMPILER_INFO) &   \
        defined(ARCH_NAME)

        print_build_info();
    
    #endif

    // shell
    while (1) {
        // welcome to vae shell!
        print("vae> ");

        // keyboard_input uses hlt, 
        // so the processor doesn't put a load on the system
        // until you enter a string and press Enter
        keyboard_input(cmd_buffer, 64);

        keyboard_capture();
        input(cmd_buffer);
        keyboard_release();

        __asm__ volatile("hlt");
    }
}