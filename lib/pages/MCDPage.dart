import 'package:flutter/material.dart';
import '../controller/MCDController.dart';

class MCDPage extends StatefulWidget {
  @override
  State<MCDPage> createState() => MCDPageState();
}

class MCDPageState extends State<MCDPage> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();

  int _mcd = 0;

  void _calcularMCD() {
    try {
      int num1 = int.parse(_num1Controller.text);
      int num2 = int.parse(_num2Controller.text);

      if (num1 <= 0 || num2 <= 0) {
        _mostrarAlerta('Por favor, ingrese números positivos.');
        return;
      }

      setState(() {
        _mcd = calcularMCD(num1, num2);
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
        title: Text('Máximo Común Divisor'),
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
                'Ingrese dos números para calcular su MCD:',
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
              TextField(
                controller: _num2Controller,
                decoration: const InputDecoration(
                  labelText: 'Número 2',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calcularMCD,
                child: const Text('Calcular MCD'),
              ),
              const SizedBox(height: 20),
              Text(
                'MCD: $_mcd',
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
