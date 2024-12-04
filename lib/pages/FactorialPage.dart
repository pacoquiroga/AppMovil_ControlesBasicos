import 'package:flutter/material.dart';
import '../controller/FactorialController.dart';

class FactorialPage extends StatefulWidget {
  @override
  State<FactorialPage> createState() => FactorialPageState();
}

class FactorialPageState extends State<FactorialPage> {
  final TextEditingController _num1Controller = TextEditingController();

  int _fact = 0;

  void _calcularFactorial() {
    try {
      int num1 = int.parse(_num1Controller.text);

      if (num1 <= 0) {
        _mostrarAlerta('Por favor, ingrese números positivos.');
        return;
      }

      setState(() {
        _fact = calcularFactorial(num1).toInt();
      });
    } catch (e) {
      _mostrarAlerta('Por favor, ingrese solo números válidos.');
    }
  }

  void _mostrarAlerta(String mensaje) {
    AlertDialog alert = AlertDialog(
      title: const Text('Error'),
      content: Text(mensaje),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
    );

    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hallar el factorial de un número'),
        backgroundColor: Color.fromARGB(255, 57, 63, 65),
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
                'Ingrese número para calcular su factorial:',
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xFFF1F0E8),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _num1Controller,
                decoration: const InputDecoration(
                  labelText: 'Número 1',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calcularFactorial,
                child: const Text('Calcular MCD'),
              ),
              const SizedBox(height: 20),
              Text(
                'MCD: $_fact',
                style: const TextStyle(
                  fontSize: 24,
                  color: Color(0xFFF1F0E8),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
