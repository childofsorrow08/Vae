#if !defined(PIC_H)
#define PIC_H

#include <stdint.h>

extern void pic_remap(int offset1, int offset2);
void pic_send_eoi(uint8_t irq);

#endif