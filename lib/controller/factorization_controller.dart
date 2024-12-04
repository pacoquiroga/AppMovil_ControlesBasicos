class FactorizationController {
  // Función para calcular la factorización
  List<Map<String, int>> factorize(int number) {
    List<Map<String, int>> factors = [];
    int factor = 2;

    while (number > 1) {
      int power = 0;

      while (number % factor == 0) {
        power++;
        number ~/= factor;
      }

      if (power > 0) {
        factors.add({'factor': factor, 'power': power});
      }
      factor++;
    }

    return factors;
  }
}
