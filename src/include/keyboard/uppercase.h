#if !defined (KEYBOARD_UPPERCASE_H)
#define KEYBOARD_UPPERCASE_H

// US QWERTY Scancode Set 1 (Uppercase / Shift state)
static const char scancode_uppercase[128] = {
    0,              // 0x00: Null / Error / Unused
    27,             // 0x01: ESC
    '!', '@', '#',  // 0x02-0x04: Shifted numbers (1, 2, 3)
    '$', '%', '^',  // 0x05-0x07: Shifted numbers (4, 5, 6)
    '&', '*', '(',  // 0x08-0x0A: Shifted numbers (7, 8, 9)
    ')',            // 0x0B: Shifted '0' -> ')'
    '_',            // 0x0C: Shifted '-' -> '_'
    '+',            // 0x0D: Shifted '=' -> '+'
    '\b',           // 0x0E: Backspace
    '\t',           // 0x0F: Tab
    'Q', 'W', 'E',  // 0x10-0x12: Uppercase QWERTY row 1
    'R', 'T', 'Y',  // 0x13-0x15: Uppercase QWERTY row 1
    'U', 'I', 'O',  // 0x16-0x18: Uppercase QWERTY row 1
    'P',            // 0x19: Uppercase 'P'
    '{',            // 0x1A: Shifted '[' -> '{'
    '}',            // 0x1B: Shifted ']' -> '}'
    '\n',           // 0x1C: Enter / Return
    0,              // 0x1D: Left Control (Non-printable)
    'A', 'S', 'D',  // 0x1E-0x20: Uppercase ASDF row 2
    'F', 'G', 'H',  // 0x21-0x23: Uppercase ASDF row 2
    'J', 'K', 'L',  // 0x24-0x26: Uppercase ASDF row 2
    ':',            // 0x27: Shifted ';' -> ':'
    '"',            // 0x28: Shifted '\'' -> '"' (Double quote)
    '~',            // 0x29: Shifted '`' -> '~' (Tilde)
    0,              // 0x2A: Left Shift (Non-printable)
    '|',            // 0x2B: Shifted '\\' -> '|' (Pipe)
    'Z', 'X', 'C',  // 0x2C-0x2E: Uppercase ZXCV row 3
    'V', 'B', 'N',  // 0x2F-0x31: Uppercase ZXCV row 3
    'M',            // 0x32: Uppercase 'M'
    '<',            // 0x33: Shifted ',' -> '<'
    '>',            // 0x34: Shifted '.' -> '>'
    '?',            // 0x35: Shifted '/' -> '?'
    0,              // 0x36: Right Shift (Non-printable)
    '*',            // 0x37: Numpad Asterisk
    0,              // 0x38: Left Alt (Non-printable)
    ' ',            // 0x39: Spacebar
    0,              // 0x3A: Caps Lock (Non-printable)
    0, 0, 0, 0, 0,  // 0x3B-0x3F: F1 - F5 function keys
    0, 0, 0, 0, 0,  // 0x40-0x44: F6 - F10 function keys
    0, 0,           // 0x45-0x46: Num Lock & Scroll Lock
    '7',            // 0x47: Numpad 7
    '8',            // 0x48: Numpad 8
    '9',            // 0x49: Numpad 9
    '-',            // 0x4A: Numpad Minus
    '4',            // 0x4B: Numpad 4
    '5',            // 0x4C: Numpad 5
    '6',            // 0x4D: Numpad 6
    '+',            // 0x4E: Numpad Plus
    '1',            // 0x4F: Numpad 1
    '2',            // 0x50: Numpad 2
    '3',            // 0x51: Numpad 3
    '0',            // 0x52: Numpad 0
    '.'             // 0x53: Numpad Decimal point
    // Indices 0x54 to 0x7F are implicitly 0
};

#endif