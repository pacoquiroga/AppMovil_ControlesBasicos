import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import '../controller/prime_numbers_controller.dart';

// Función global para calcular primos usando compute
Future<List<int>> _computePrimes() async {
  return await compute(_findPrimes, {"start": 3, "end": 32767});
}

List<int> _findPrimes(Map<String, int> range) {
  final controller = PrimeNumbersController();
  return controller.getPrimesInRange(range['start']!, range['end']!);
}

class PrimeNumbersPage extends StatefulWidget {
  @override
  _PrimeNumbersPageState createState() => _PrimeNumbersPageState();
}

class _PrimeNumbersPageState extends State<PrimeNumbersPage> {
  List<int> _primes = [];
  bool _isLoading = false;

  void _calculatePrimes() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final primes = await _computePrimes();
      setState(() {
        _primes = primes;
      });
    } catch (e) {
      log("Error calculating primes: $e");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Números Primos"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _isLoading ? null : _calculatePrimes,
              child: Text("Calcular Primos"),
            ),
            SizedBox(height: 16),
            Expanded(
              child: _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : _primes.isEmpty
                      ? Center(
                          child: Text(
                              "Presiona el botón para calcular los números primos."))
                      : GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 16,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                          ),
                          itemCount: _primes.length,
                          itemBuilder: (context, index) {
                            return Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                "${_primes[index]}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
