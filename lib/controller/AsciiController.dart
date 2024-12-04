class AsciiController{
  List<String> generarTablaASCII() {
    List<String> tablaASCII = [];
    String linea = "";
    
    for (int n = 0; n <= 255; n++) {
      linea += "\t $n = ${String.fromCharCode(n)}";
      
      if (n % 23 == 0 && n != 0) {
        tablaASCII.add(linea);
        linea = "";
      }
    }
    
    return tablaASCII;
  }
}