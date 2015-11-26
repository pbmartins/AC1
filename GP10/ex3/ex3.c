#include <stdin.h>

void main() {
    unsigned int n = 4;
    double array[] = {1.0, 2.0, 0.5, 7.2};
    double *p = array;
    printf("%f", average(p, n);
}

double average(double *array, unsigned int n) {
    unsigned int i;
    double sum = 0;
    for (i = 0; i < n; i++)
        sum += *array++;
    return sum / i;
}
