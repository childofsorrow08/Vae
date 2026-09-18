/* 
 * Copyright (C) 2026 Child of Sorrow
 * 
 * This file is part of VAE kernel.
 * VAE kernel is free software: you can redistribute it and/or modify 
 * it under the terms of the GNU General Public License as published by 
 * the Free Software Foundation, either version 3 of the License, or 
 * (at your option) any later version.
 */

#include <drivers/framebuffer.h>
#include <func/print.h>
#include <helpers/print_build_info.h>

void main(uint32_t mb_info_addr) {
    // framebuffer init
    fb_init(mb_info_addr);

    #if defined(BUILD_DATE) & defined(C_COMPILER_INFO) & defined(NASM_COMPILER_INFO) & defined(ARCH_NAME)
        print_build_info();
    #endif

    while (1) {
        __asm__ volatile("hlt");
    }
}