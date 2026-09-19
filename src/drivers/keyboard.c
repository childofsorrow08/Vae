#include <stdint.h>
#include <drivers/terminal.h>
#include <drivers/port.h>

#include <keyboard/lowercase.h>
#include <keyboard/uppercase.h>

static int shift_pressed = 0;
static int capslock_state = 0;
static int extended_code = 0;

void keyboard_poll() {
    // check if there is data in the keyboard controller buffer 
    // bit 0 of port 0x64
    if (inb(0x64) & 0x01) {
        uint8_t scancode = inb(0x60);

        // Handling extended codes
        if (scancode == 0xE0) {
            extended_code = 1;
            return;
        }

        // handle special keys (arrow keys, Insert, Delete, etc.)
        if (extended_code) {
            // for now, we'll just clear the checkbox
            extended_code = 0;
            return;
        }

        // detecting when a key is pressed (make) or released (break)
        int released = (scancode & 0x80) != 0;
        uint8_t keycode = scancode & 0x7F; // clear the release bit

        // handling modifiers (Shift, Left/Right Shift)
        if (keycode == 0x2A || keycode == 0x36) { // Left Shift (0x2A) or Right Shift (0x36)
            shift_pressed = !released;
            return;
        }

        // caps lock handling (on press only)
        if (keycode == 0x3A && !released) {
            capslock_state = !capslock_state;
            return;
        }

        // only respond to key press events
        if (!released) {
            char ascii = 0;

            // register selection logic
            int upper = shift_pressed ^ capslock_state; // XOR: if only one of them is turned on
            if (upper) {
                ascii = scancode_uppercase[keycode];
            } else {
                ascii = scancode_lowercase[keycode];
            }

            if (ascii != 0) {
                terminal_putc(ascii);
            }
        }
    }
}