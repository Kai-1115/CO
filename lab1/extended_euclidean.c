#include <stdio.h>

int mod_inverse(int a, int b) {
	// TODO 
    int original_b = b;
    int x0 = 1, x1 = 0;
    int y0 = 0, y1 = 1;
    
    a = a % b;
    if (a < 0) a += b;
    
    while (b != 0) {
        int quotient = a / b;
        
        int temp = b;
        b = a % b;
        a = temp;
        
        temp = x1;
        x1 = x0 - quotient * x1;
        x0 = temp;
        
        temp = y1;
        y1 = y0 - quotient * y1;
        y0 = temp;
    }
    
    if (a != 1) {
        return -1;
    }
    
    if (x0 < 0) {
        x0 += original_b;
    }
    
    return x0;
}

int main() {
    int a, b;
    printf("Enter the number: ");
    scanf("%d", &a);
    printf("Enter the modulo: ");
    scanf("%d", &b);

    int inv = mod_inverse(a, b);
    if (inv == -1) {
        printf("Inverse not exist.\n");
    } else {
        printf("Result: %d\n", inv);
    }

    return 0;
}
