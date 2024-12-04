import 'package:appmovil_principios/pages/FactorialPage.dart';
import 'package:flutter/material.dart';
import 'MCDPage.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Móvil Controles Básicos'),
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Seleccione un Ejercicio:',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xFFF1F0E8),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                Wrap(
                  spacing: 30,
                  runSpacing: 30,
                  alignment: WrapAlignment.center,
                  children: [
                    // _buildOperationButton(
                    //   context,
                    //   'ASCII',
                    //   Icons.abc,
                    //   ASCIIPage(),
                    // ),
                    _buildOperationButton(
                      context,
                      'Factorial',
                      Icons.warning,
                      FactorialPage(),
                    ),
                    _buildOperationButton(
                      context,
                      'MCD',
                      Icons.calculate,
                      MCDPage(),
                    ),
                    // _buildOperationButton(
                    //   context,
                    //   'Factorización',
                    //   Icons.developer_board,
                    //   FactorizacionPage(),
                    // )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOperationButton(
      BuildContext context, String title, IconData icon, Widget nextPage) {
    return SizedBox(
      width: 130,
      height: 100,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => nextPage),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFE5E1DA),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 5,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: const Color(0xFF89A8B2)),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF89A8B2),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
