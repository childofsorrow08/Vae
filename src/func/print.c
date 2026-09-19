#include <stdarg.h>

#include <drivers/terminal.h>

#include <helpers/int_to_ascii.h>

void print(const char* str, ...) {
    va_list args;
    va_start(args, str);
    char buffer[32];
    
    while (*str) {
        if (*str == '%') {
            str++;
            switch (*str) {

                // integer
                case 'd': {
                    int val = va_arg(args, int);
                    int_to_ascii(val, buffer, 10);
                    char* p = buffer;
                    while (*p) terminal_putc(*p++);
                    break;
                }

                // unsigned integer
                case 'x': {
                    unsigned int val = va_arg(args, unsigned int);
                    int_to_ascii(val, buffer, 16);
                    char* p = buffer;
                    while (*p) terminal_putc(*p++);
                    break;
                }

                // string
                case 's': {
                    char* s = va_arg(args, char*);
                    if (!s) s = "(null)";
                    while (*s) terminal_putc(*s++);
                    break;
                }

                // character
                case 'c': {
                    char c = (char)va_arg(args, int);
                    terminal_putc(c);
                    break;
                }

                // %
                case '%':
                    terminal_putc('%');
                    break;
            }
        } else {
            terminal_putc(*str);
        }
        str++;
    }
    va_end(args);
}