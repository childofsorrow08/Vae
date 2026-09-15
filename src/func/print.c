#include <stdarg.h>

#define VGA
#include <drivers.h>

static void print_int(long long value, int base, int uppercase) {
    char buf[64];
    int i = 0;
    int is_negative = 0;

    if (value == 0) {
        vga_putchar('0');
        return;
    }

    if (value < 0 && base == 10) {
        is_negative = 1;
        value = -value;
    }

    while (value > 0) {
        int rem = value % base;
        if (rem >= 10) {
            buf[i++] = (uppercase ? 'A' : 'a') + (rem - 10);
        } else {
            buf[i++] = '0' + rem;
        }
        value /= base;
    }

    if (is_negative) {
        buf[i++] = '-';
    }

    while (--i >= 0) {
        vga_putchar(buf[i]);
    }
}

void vprint(const char* format, va_list parameters) {
    for (const char* traverse = format; *traverse != '\0'; traverse++) {
        if (*traverse != '%') {
            vga_putchar(*traverse);
            continue;
        }

        traverse++; // Parsing '%'
        switch (*traverse) {

            // char
            case 'c': {
                char c = (char) va_arg(parameters, int);
                vga_putchar(c);
                break;
            }

            // string
            case 's': {
                const char* s = va_arg(parameters, const char*);
                vga_write(s ? s : "(null)");
                break;
            }

            // decimal
            case 'd':

            // int
            case 'i': {
                int val = va_arg(parameters, int);
                print_int(val, 10, 0);
                break;
            }

            // unsigned int
            case 'x': {
                unsigned int val = va_arg(parameters, unsigned int);
                print_int(val, 16, 0);
                break;
            }

            // void
            case 'p': {
                void* ptr = va_arg(parameters, void*);
                vga_write("0x");
                print_int((unsigned long long) ptr, 16, 0);
                break;
            }

            // wildcard
            case '%': {
                vga_putchar('%');
                break;
            }

            // wildcard 2.0
            default: {
                vga_putchar('%');
                vga_putchar(*traverse);
                break;
            }
        }
    }
}

/* 
 * Pretty same to printf() in standart libc
 *
 * You can use %* for including variables into your print result
 * %c - char
 * %s - string
 * %d - decimal
 * %i - int
 * %x - unsigned int
 * %p - void
 */
void print(const char* format, ...) {
    va_list parameters;
    va_start(parameters, format);
    vprint(format, parameters);
    va_end(parameters);
}