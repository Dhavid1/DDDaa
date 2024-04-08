

MAGIC       equ 0x1BADB002
MBALIGN     equ 1 << 0
MEMINFO     equ 1 << 1
FLAGS       equ MBALIGN |MEMINFO
CHECKSUM    equ -(MAGIC + FLAGS)


section .multiboot
    align 4
    dd  MAGIC 
    dd  FLAGS
    dd  CHECKSUM

section .bss
    align 16
    stack_bottom:
        resb    4096
    stack_top:

global start
section .text
    start:
        mov esp, $stack_top

        call kmain

        hang:
            cli
            hlt
            jmp hang