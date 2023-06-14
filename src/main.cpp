#include <cstdio>
#include "pico/stdlib.h"
// #include "btstack_audio.h" TODO Remove as unnecessary

extern int16_t return_start[];
extern int16_t *return_end;
extern int16_t absorb_start[];

int main() {
    setup_default_uart();
    printf("Hello, world!: %d\n", return_end - return_start);

    return 0;
}