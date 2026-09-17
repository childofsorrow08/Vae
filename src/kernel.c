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
#include <resources/Venom-Snake-Render.h>

void draw_venom_snake(int start_x, int start_y) {
    if (!fb.addr) return;

    for (int y = 0; y < VENOM_SNAKE_RENDER_HEIGHT; y++) {
        if ((start_y + y) >= (int)fb.height) break;
        if ((start_y + y) < 0) continue;

        for (int x = 0; x < VENOM_SNAKE_RENDER_WIDTH; x++) {
            if ((start_x + x) >= (int)fb.width) break;
            if ((start_x + x) < 0) continue;

            uint32_t color = Venom_Snake_Render[y * VENOM_SNAKE_RENDER_WIDTH + x];

            if (color == 0x000000) continue;

            uint32_t* pixel = (uint32_t*)((uint8_t*)fb.addr + (start_y + y) * fb.pitch) + (start_x + x);
            *pixel = color;
        }
    }
}

void main(uint32_t mb_info_addr) {
    // framebuffer init
    fb_init(mb_info_addr);

    for (uint32_t y = 0; y < 100; y++) {
        for (uint32_t x = 0; x < 100; x++) {
            fb.addr[y * (fb.pitch / 4) + x] = 0x00FF0000;
        }
    }

    for (uint32_t y = 0; y < 100; y++) {
        for (uint32_t x = 100; x < 200; x++) {
            fb.addr[y * (fb.pitch / 4) + x] = 0xFFFFFFFF;
        }
    }

    for (uint32_t y = 0; y < 100; y++) {
        for (uint32_t x = 200; x < 300; x++) {
            fb.addr[y * (fb.pitch / 4) + x] = 0xFF0062FF;
        }
    }

    for (uint32_t y = 100; y < 200; y++) {
        for (uint32_t x = 0; x < 300; x++) {
            fb.addr[y * (fb.pitch / 4) + x] = 0xFF0057B7;
        }
    }

    for (uint32_t y = 200; y < 300; y++) {
        for (uint32_t x = 0; x < 300; x++) {
            fb.addr[y * (fb.pitch / 4) + x] = 0xFFFFDD00;
        }
    }

    draw_string_16x16(20, 100, "Font test 16x16", 0xFFFFDD00);
    draw_string_8x16(20, 200, "Font test 8x16", 0xFF0057B7);

    draw_string_8x16(20, 300, 
        "We passed upon the stairs\n"
        "We spoke of was and when\n"
        "Although I wasn't there\n"
        "He said I was his friend\n"
        "Which came as a surprise\n"
        "I spoke into his eyes\n"
        "I thought you died alone\n"
        "A long long time ago\n"
        "Oh no, not me\n"
        "We never lost control\n"
        "You're face to face\n"
        "With the man who sold the world", 
    0xFFFFFFFF
    );

    draw_venom_snake(500, 0);

    while (1) {
        __asm__ volatile("hlt");
    }
}