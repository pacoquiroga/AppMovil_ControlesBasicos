//hallar el factorial de un numero con un long double
import 'dart:math';

double calcularFactorial(int n) {
  if (n == 0) {
    return 1;
  } else {
    return n * calcularFactorial(n - 1);
  }
}
