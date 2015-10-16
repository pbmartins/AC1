#include <stdio.h>

int main(void) {
    int value, bit, i;
    printf("Introduza um numero: ");
    scanf("%d", &value);
    printf("\nO valor em binario: ");
    typedef enum { false, true } bool;
    bool not_zeros = false;
    for(i=0; i < 32; i++) {
        bit = value & 0x80000000;
        bit = bit >> 1;
        printf("%d", bit);
	if (0x30 + bit == '1' || not_zeros == true) {
            printf("%c", 0x30 + bit);
            not_zeros = true;
        }
        value = value << 1;
    }
    printf("\n");
    return 0;
}
