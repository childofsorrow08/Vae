#include <framebuffer.h>
#include <resources/font.h>

framebuffer_t fb = {0};

struct multiboot_tag {
    uint32_t type;
    uint32_t size;
};

struct multiboot_tag_framebuffer {
    uint32_t type;
    uint32_t size;
    uint64_t framebuffer_addr;
    uint32_t framebuffer_pitch;
    uint32_t framebuffer_width;
    uint32_t framebuffer_height;
    uint8_t  framebuffer_bpp;
    uint8_t  framebuffer_type;
    uint16_t reserved;
};

void fb_init(uint32_t mb_info_addr) {
    struct multiboot_tag* tag = (struct multiboot_tag*)(uintptr_t)(mb_info_addr + 8);

    while (tag->type != 0) {
        if (tag->type == 8) { // multiboot2 framebuffer tag = 2
            struct multiboot_tag_framebuffer* fb_tag = (struct multiboot_tag_framebuffer*)tag;
            
            fb.addr = (uint32_t*)(uintptr_t)fb_tag->framebuffer_addr;
            fb.width = fb_tag->framebuffer_width;
            fb.height = fb_tag->framebuffer_height;
            fb.pitch = fb_tag->framebuffer_pitch;
            break;
        }
        tag = (struct multiboot_tag*)((uint8_t*)tag + ((tag->size + 7) & ~7));
    }
}

// --------------------------------------- 16x16 ---------------------------------------

void draw_char_16x16(int x, int y, char c, uint32_t color) {
    if (!fb.addr) return;
    
    const uint16_t* glyph = font_data[(unsigned char)c];

    for (int cy = 0; cy < 16; cy++) {
        uint16_t row = glyph[cy];
        for (int cx = 0; cx < 16; cx++) {
            if (row & (1 << (15 - cx))) {
                uint32_t* pixel = (uint32_t*)((uint8_t*)fb.addr + (y + cy) * fb.pitch) + (x + cx);
                *pixel = color;
            }
        }
    }
}

void draw_string_16x16(int start_x, int start_y, const char* str, uint32_t color) {
    int x = start_x;
    int y = start_y;
    
    while (*str) {
        if (*str == '\n') {
            x = start_x;
            y += 16;
        } else {
            draw_char_16x16(x, y, *str, color);
            x += 16;
        }
        str++;
    }
}

// --------------------------------------- 8x16 ---------------------------------------

void draw_char_8x16(int x, int y, char c, uint32_t color) {
    if (!fb.addr) return;
    
    const uint16_t* glyph = font_data[(unsigned char)c];

    for (int cy = 0; cy < 16; cy++) {
        uint16_t row = glyph[cy];
        for (int cx = 0; cx < 8; cx++) {
            // reduce the size to 8x16
            // read every other bit
            if (row & (1 << (15 - (cx * 2)))) {
                uint32_t* pixel = (uint32_t*)((uint8_t*)fb.addr + (y + cy) * fb.pitch) + (x + cx);
                *pixel = color;
            }
        }
    }
}

void draw_string_8x16(int start_x, int start_y, const char* str, uint32_t color) {
    int x = start_x;
    int y = start_y;
    
    while (*str) {
        if (*str == '\n') {
            x = start_x;
            y += 16;
        } else {
            draw_char_8x16(x, y, *str, color);
            x += 16;
        }
        str++;
    }
}