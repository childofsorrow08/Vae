#if !defined(TERMINAL_H)
#define TERMINAL_H

#include <stdint.h>

uint32_t terminal_get_x();
uint32_t terminal_get_y();

extern void terminal_putc(char c);
extern void terminal_clear();

#endif