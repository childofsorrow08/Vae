#include <stdarg.h>
#include <drivers/terminal.h>

static int int_to_ascii(int value, char* str, int base) {
    char* rc = str;
    char* ptr = rc;
    char* low;
    
    if (base < 2 || base > 36) { *str = '\0'; return 0; }
    
    if (value < 0 && base == 10) {
        *ptr++ = '-';
        value = -value;
    }
    
    low = ptr;
    do {
        int modulo = value % base;
        *ptr++ = (modulo < 10) ? (modulo + '0') : (modulo - 10 + 'a');
        value /= base;
    } while (value);
    
    *ptr-- = '\0';
    
    while (low < ptr) {
        char tmp = *low;
        *low++ = *ptr;
        *ptr-- = tmp;
    }
    
    return 0;
}

void print(const char* fmt, ...) {
    va_list args;
    va_start(args, fmt);
    char buffer[32];
    
    while (*fmt) {
        if (*fmt == '%') {
            fmt++;
            switch (*fmt) {
                case 'd': {
                    int val = va_arg(args, int);
                    int_to_ascii(val, buffer, 10);
                    char* p = buffer;
                    while (*p) terminal_putc(*p++);
                    break;
                }
                case 'x': {
                    unsigned int val = va_arg(args, unsigned int);
                    int_to_ascii(val, buffer, 16);
                    char* p = buffer;
                    while (*p) terminal_putc(*p++);
                    break;
                }
                case 's': {
                    char* s = va_arg(args, char*);
                    if (!s) s = "(null)";
                    while (*s) terminal_putc(*s++);
                    break;
                }
                case 'c': {
                    char c = (char)va_arg(args, int);
                    terminal_putc(c);
                    break;
                }
                case '%':
                    terminal_putc('%');
                    break;
            }
        } else {
            terminal_putc(*fmt);
        }
        fmt++;
    }
    va_end(args);
}