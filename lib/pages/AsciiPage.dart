import 'package:flutter/material.dart';
import '../controller/AsciiController.dart';

class AsciiPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _AsciiPageState();
}

class _AsciiPageState extends State<AsciiPage>{
  //Instanciar el Controller
  AsciiController asciiController = AsciiController();

  //Variables
  List<String> tablaASCII = [];
  int indice = 0;

  //Funciones
  void _cambiarIndice(int suma){
    setState(() {
      indice = indice + suma;
      if(indice >= tablaASCII.length){
        indice = 0;
      }
      if(indice < 0){
        indice = tablaASCII.length - 1;
      }
    });
  }

  //Generar la tabla ASCII
  @override
  void initState() {
    super.initState();
    tablaASCII = asciiController.generarTablaASCII();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Códigos ASCII'),
        backgroundColor: const Color.fromARGB(255, 57, 63, 65),
        titleTextStyle: const TextStyle(
          color: Color(0xFFF1F0E8),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF89A8B2),
              Color(0xFFB3C8CF),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Tabla de codigos ASCII',
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xFFF1F0E8),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                tablaASCII[indice],
                style: const TextStyle(
                  fontSize: 24,
                  color: Color(0xFFF1F0E8),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _cambiarIndice(1),
                child: const Text('Siguiente'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _cambiarIndice(-1),
                child: const Text('Anterior'),
              ),
            ],
          ),
        ),
      ),
    );
  }

}