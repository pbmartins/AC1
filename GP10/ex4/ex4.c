#include <stdin.h>

void main() {
    unsigned n = 4;
    double array[] = {1, 3, 7, 4};
    double *p = array;
    fprintf("%f", max(p, n));
}

double max(double *array, unsigned int n) {
    unsigned int i;
    double max = *array;
    array++;

    for (i = 1; i < n; i++, array++) {
        if (*array > max)
            max = *array;
    }
    return max;
}
