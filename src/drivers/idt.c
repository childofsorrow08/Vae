#include <stdint.h>

struct idt_entry {
    uint16_t base_low;
    uint16_t sel;
    uint8_t  always0;
    uint8_t  flags;
    uint16_t base_high;
} __attribute__((packed));

struct idt_ptr {
    uint16_t limit;
    uint32_t base;
} __attribute__((packed));

#define IDT_ENTRIES 256

static struct idt_entry idt[IDT_ENTRIES];
static struct idt_ptr idt_reg;

extern void idt_flush(uint32_t);
extern void irq1_stub(void);

void idt_set_gate(int n, uint32_t handler, uint16_t sel, uint8_t flags) {
    idt[n].base_low = handler & 0xFFFF;
    idt[n].sel = sel;
    idt[n].always0 = 0;
    idt[n].flags = flags;
    idt[n].base_high = (handler >> 16) & 0xFFFF;
}

void idt_init(void) {
    idt_reg.limit = sizeof(idt) - 1;
    idt_reg.base = (uint32_t)idt;

    for (int i = 0; i < IDT_ENTRIES; i++) {
        idt[i].base_low = 0;
        idt[i].sel = 0;
        idt[i].always0 = 0;
        idt[i].flags = 0;
        idt[i].base_high = 0;
    }

    // register irq1_stub to vector 0x21 
    // 33 in decimal, which corresponds to IRQ1 after remapping the PIC to 32
    // 0x08 - code segment selector, 0x8E - flags
    idt_set_gate(0x21, (uint32_t)irq1_stub, 0x08, 0x8E);

    idt_flush((uint32_t)&idt_reg);
}