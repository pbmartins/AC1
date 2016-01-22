#include <stdin.h>

void main() {
    unsigned int n = 11, i = -1;
    int tmp;
    static double array[] = new double[11];
    double *p = array;
    
    while(++i < 11) {
        printf("\nIntroduza um numero: ");
        scanf("%d", tmp);
        array[i] = f2c((double)tmp);
        printf("\n%f", array[i]);
    }
    
    printf("\nTemperatura máxima: %f", max(p, n));
    printf("\nTemperatura média: %f", average(p, n));
    printf("\nMediana: %f", sort(p, n));
    printf("\nVariância: %f", var(p, n));
    printf("\nDesvio padrão: %f", stdev(p, n));
}
