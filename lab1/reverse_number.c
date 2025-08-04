#include <stdio.h>

int reverseNumber(int n) {
    // TODO
    int r = 0;
    while(n > 0)
    {
        r = r * 10 + n % 10;
        n /= 10;
    }
    return r;
}

int main() {
    int n;
    printf("Enter a number: ");
    scanf("%d", &n);

    int result = reverseNumber(n);
    printf("Reversed number: %d\n", result);

    return 0;
}
