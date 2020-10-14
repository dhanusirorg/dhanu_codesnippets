// Calculator in C

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

// Calculator Functions
void addition() {
  int num1, num2;

  printf("\nEnter first number: ");
  scanf("%d", &num1);
  printf("\nEnter second number: ");
  scanf("%d", &num2);
  printf("\n[ %d + %d = %d ]\n", num1, num2, (num1 + num2));
}

void subtraction() {
  int num1, num2;

  printf("\nEnter first number: ");
  scanf("%d", &num1);
  printf("\nEnter second number: ");
  scanf("%d", &num2);
  printf("\n[ %d - %d = %d ]\n", num1, num2, (num1 - num2));
}

void multiplication() {
  int num1, num2;

  printf("\nEnter first number: ");
  scanf("%d", &num1);
  printf("\nEnter second number: ");
  scanf("%d", &num2);
  printf("\n[ %d x %d = %d ]\n", num1, num2, (num1 * num2));
}

void division() {
  float num1, num2;

  printf("\nEnter first number: ");
  scanf("%f", &num1);
  printf("\nEnter second number: ");
  scanf("%f", &num2);
  printf("\n[ %.2f / %.2f = %.2f ]\n", num1, num2, (num1 / num2));
}

void power() {
  float num1, num2;

  printf("\nEnter the number: ");
  scanf("%f", &num1);
  printf("\nEnter the power raised: ");
  scanf("%f", &num2);
  printf("\n[ %.1f^%.2f = %.2f ]\n", num1, num2, pow(num1, num2));
}

int main() {
  // variable to take choice from user
  int choice;

  // infinite while loop to print the menu till exit is selected
  while(1) {
    // print menu
    printf("\n--- CALCULATOR ---\n");
    printf("\n1) Addition");
    printf("\n2) Subtraction");
    printf("\n3) Multiplication");
    printf("\n4) Division");
    printf("\n5) Power");
    printf("\n6) Exit");

    printf("\nEnter Your Choice: ");
    // accept choice from user
    scanf("%d", &choice);

    switch(choice) {
      case 1:
        addition();
        break;
      case 2:
        subtraction();
        break;
      case 3:
        multiplication();
        break;
      case 4:
        division();
        break;
      case 5:
        power();
        break;
      case 6:
        printf("\nBye!\n");
        exit(0);
      default:
        printf("Invalid choice!");
    }
  }

  return 0;
}
