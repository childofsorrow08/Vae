#ifndef FRAMEBUFFER_H
#define FRAMEBUFFER_H

#include <stdint.h>

typedef struct {
    uint32_t* addr;
    uint32_t width;
    uint32_t height;
    uint32_t pitch;
} framebuffer_t;

#if defined (FB)
extern framebuffer_t fb;
#endif

void fb_init(uint32_t mb_info_addr);

void draw_char_16x16(int x, int y, char c, uint32_t color);
void draw_string_16x16(int start_x, int start_y, const char* str, uint32_t color);

void draw_char_816(int x, int y, char c, uint32_t color);
void draw_string_8x16(int start_x, int start_y, const char* str, uint32_t color);

#endif