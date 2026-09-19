#include <stdint.h>

#include <drivers/terminal.h>
#include <drivers/port.h>

#include <keyboard/lowercase.h>
#include <keyboard/uppercase.h>

#define INPUT_BUFFER_SIZE 256

static char input_buffer[INPUT_BUFFER_SIZE];

static int input_index = 0;
static int line_ready = 0;
static int shift_pressed = 0;
static int capslock_state = 0;
static int extended_code = 0;
static int keyboard_captured = 0;

void keyboard_capture() { keyboard_captured = 1; }
void keyboard_release() { keyboard_captured = 0; }

void keyboard_interrupt_handler() {
    uint8_t scancode = inb(0x60);

    if (keyboard_captured) return;

    if (scancode == 0xE0)   { extended_code = 1; return; }
    if (extended_code)      { extended_code = 0; return; }

    int released = (scancode & 0x80) != 0;
    uint8_t keycode = scancode & 0x7F;

    if (keycode == 0x2A || keycode == 0x36)     { shift_pressed = !released; return; }
    if (keycode == 0x3A && !released)           { capslock_state = !capslock_state; return; }

    if (!released) {

        // Enter
        if (keycode == 0x1C) {
            input_buffer[input_index] = '\0';
            line_ready = 1;
            terminal_putc('\n');
            return;
        }

        // Backspace
        if (keycode == 0x0E) {
            if (input_index > 0) {
                input_index--;
                input_buffer[input_index] = '\0';
                terminal_putc('\b');
            }
            return;
        }

        // Regular characters
        char ascii = 0;
        int upper = shift_pressed ^ capslock_state;
        if (upper) {
            ascii = scancode_uppercase[keycode];
        } else {
            ascii = scancode_lowercase[keycode];
        }

        if (ascii != 0 && input_index < INPUT_BUFFER_SIZE - 1) {
            input_buffer[input_index++] = ascii;
            terminal_putc(ascii);
        }
    }
}

void keyboard_input(char* buffer, int max_len) {
    line_ready = 0;
    input_index = 0;
    input_buffer[0] = '\0';

    while (!line_ready) {
        __asm__ volatile("hlt");
    }

    int i = 0;
    while (input_buffer[i] != '\0' && i < max_len - 1) {
        buffer[i] = input_buffer[i];
        i++;
    }
    buffer[i] = '\0';
}