#include <stdint.h>
#include <drivers/framebuffer.h>

extern framebuffer_t fb;

typedef struct {
    int x;
    int y;
    uint32_t current_color;
} terminal_cursor_t;

static terminal_cursor_t term = {
    .x = 10,
    .y = 10,
    .current_color = 0xFFFFFF 
};

void terminal_scroll() {
    if (!fb.addr) return;
    
    int char_height = 16;     // 8x16
    uint32_t* dest = fb.addr;
    
    int total_pixels_to_copy = (fb.height - char_height) * (fb.pitch / 4);
    uint32_t* src = (uint32_t*)((uint8_t*)fb.addr + char_height * fb.pitch);
    
    for (int i = 0; i < total_pixels_to_copy; i++) {
        dest[i] = src[i];
    }
    
    int last_row_start = (fb.height - char_height) * (fb.pitch / 4);
    int last_row_pixels = char_height * (fb.pitch / 4);
    for (int i = 0; i < last_row_pixels; i++) {
        dest[last_row_start + i] = 0x000000;
    }
    
    term.y -= char_height;
}

void terminal_putc(char c) {
    if (!fb.addr) return;

    if (c == '\n') {
        term.x = 10;
        term.y += 16;
    } else if (c == '\r') {
        term.x = 10;
    } else {
        if (term.x + 8 >= fb.width - 10) {
            term.x = 10;
            term.y += 16;
        }
        
        if (term.y + 16 >= fb.height - 10) {
            terminal_scroll();
        }

        draw_char_8x16(term.x, term.y, c, term.current_color);
        term.x += 8;
    }
}

void terminal_set_color(uint32_t color) {
    term.current_color = color;
}