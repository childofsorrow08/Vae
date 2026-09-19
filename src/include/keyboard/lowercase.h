#if !defined (KEYBOARD_LOWERCASE_H)
#define KEYBOARD_LOWERCASE_H

// US QWERTY Scancode Set 1 (Lowercase / Default state)
static const char scancode_lowercase[128] = {
    0,              // 0x00: Null / Error / Unused
    27,             // 0x01: ESC (Escape key)
    '1', '2', '3',  // 0x02-0x04: Number keys row
    '4', '5', '6',  // 0x05-0x07: Number keys row
    '7', '8', '9',  // 0x08-0x0A: Number keys row
    '0',            // 0x0B: Number '0'
    '-',            // 0x0C: Hyphen / Minus
    '=',            // 0x0D: Equals sign
    '\b',           // 0x0E: Backspace
    '\t',           // 0x0F: Tab
    'q', 'w', 'e',  // 0x10-0x12: QWERTY row 1
    'r', 't', 'y',  // 0x13-0x15: QWERTY row 1
    'u', 'i', 'o',  // 0x16-0x18: QWERTY row 1
    'p',            // 0x19: Letter 'p'
    '[',            // 0x1A: Left bracket
    ']',            // 0x1B: Right bracket
    '\n',           // 0x1C: Enter / Return
    0,              // 0x1D: Left Control (Modifier, non-printable -> 0)
    'a', 's', 'd',  // 0x1E-0x20: ASDF row 2
    'f', 'g', 'h',  // 0x21-0x23: ASDF row 2
    'j', 'k', 'l',  // 0x24-0x26: ASDF row 2
    ';',            // 0x27: Semicolon
    '\'',           // 0x28: Single quote / Apostrophe
    '`',            // 0x29: Grave accent / Tilde key
    0,              // 0x2A: Left Shift (Modifier, non-printable -> 0)
    '\\',           // 0x2B: Backslash
    'z', 'x', 'c',  // 0x2C-0x2E: ZXCV row 3
    'v', 'b', 'n',  // 0x2F-0x31: ZXCV row 3
    'm',            // 0x32: Letter 'm'
    ',',            // 0x33: Comma
    '.',            // 0x34: Period / Dot
    '/',            // 0x35: Forward slash
    0,              // 0x36: Right Shift (Modifier, non-printable -> 0)
    '*',            // 0x37: Numpad Asterisk / Print Screen part
    0,              // 0x38: Left Alt (Modifier, non-printable -> 0)
    ' ',            // 0x39: Spacebar
    0,              // 0x3A: Caps Lock (State modifier, non-printable -> 0)
    0, 0, 0, 0, 0,  // 0x3B-0x3F: F1 - F5 function keys (non-printable -> 0)
    0, 0, 0, 0, 0,  // 0x40-0x44: F6 - F10 function keys (non-printable -> 0)
    0, 0,           // 0x45-0x46: Num Lock & Scroll Lock
    '7',            // 0x47: Numpad 7 / Home
    '8',            // 0x48: Numpad 8 / Up Arrow
    '9',            // 0x49: Numpad 9 / Page Up
    '-',            // 0x4A: Numpad Minus
    '4',            // 0x4B: Numpad 4 / Left Arrow
    '5',            // 0x4C: Numpad 5
    '6',            // 0x4D: Numpad 6 / Right Arrow
    '+',            // 0x4E: Numpad Plus
    '1',            // 0x4F: Numpad 1 / End
    '2',            // 0x50: Numpad 2 / Down Arrow
    '3',            // 0x51: Numpad 3 / Page Down
    '0',            // 0x52: Numpad 0 / Insert
    '.'             // 0x53: Numpad Delete / Decimal point
    // Indices 0x54 to 0x7F are implicitly initialized to 0 (Unused/Extended scancodes)
};

#endif