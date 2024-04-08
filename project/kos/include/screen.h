#ifndef SCREEN_H
#define SCREEN_H

#include "datatypes.h"

int8 vga_row = 0, vga_col = 0;
const uint8 vga_cols = 80, vga_rows = 25, vga_dep = 2;
string vga_buffer = (string)0xb8000;

void put_char(char c){
    vga_buffer[0] = c;
    vga_buffer[1] = 0x0F;
}

#endif