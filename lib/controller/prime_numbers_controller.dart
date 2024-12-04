import 'dart:math';

class PrimeNumbersController {
  // Función optimizada para obtener números primos en un rango
  List<int> getPrimesInRange(int start, int end) {
    List<int> primes = [];
    for (int number = start; number <= end; number++) {
      if (_isPrime(number)) primes.add(number);
    }
    return primes;
  }

  bool _isPrime(int number) {
    if (number < 2) return false;
    for (int i = 2; i <= sqrt(number).toInt(); i++) {
      if (number % i == 0) return false;
    }
    return true;
  }
}
