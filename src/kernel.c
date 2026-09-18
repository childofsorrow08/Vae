/* 
 * Copyright (C) 2026 Child of Sorrow
 * 
 * This file is part of VAE kernel.
 * VAE kernel is free software: you can redistribute it and/or modify 
 * it under the terms of the GNU General Public License as published by 
 * the Free Software Foundation, either version 3 of the License, or 
 * (at your option) any later version.
 */
 
#define FB
#include <framebuffer.h>

void main(uint32_t mb_info_addr) {
    // framebuffer init
    fb_init(mb_info_addr);
    
    while (1) {
        __asm__ volatile("hlt");
    }
}