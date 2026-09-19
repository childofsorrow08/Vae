#if !defined (KEYBOARD_H)
#define KEYBOARD_H

extern void keyboard_capture();
extern void keyboard_release();

extern void keyboard_interrupt_handler();

void keyboard_input(char* buffer, int max_len);

#endif