import 'package:flutter/material.dart';
import '../controller/factorization_controller.dart';

class FactorizationPage extends StatefulWidget {
  @override
  _FactorizationPageState createState() => _FactorizationPageState();
}

class _FactorizationPageState extends State<FactorizationPage> {
  final TextEditingController _controller = TextEditingController();
  final FactorizationController _factorizationController =
      FactorizationController();
  List<Map<String, int>> _factors = [];

  void _calculateFactors() {
    final int? number = int.tryParse(_controller.text);
    if (number != null && number > 0) {
      setState(() {
        _factors = _factorizationController.factorize(number);
      });
    } else {
      setState(() {
        _factors = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Factorización de Números"),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: "Introduce un número entero",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.numbers, color: Colors.indigo),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: _calculateFactors,
                icon: Icon(Icons.calculate, color: Colors.white),
                label: Text("Calcular Factorización"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
              SizedBox(height: 16),
              _factors.isNotEmpty
                  ? Expanded(
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.indigo.shade50,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: DataTable(
                                headingRowColor: MaterialStateProperty.all(
                                    Colors.indigo.shade100),
                                columns: [
                                  DataColumn(
                                    label: Text(
                                      "Factor",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.indigo,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      "Potencia",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.indigo,
                                      ),
                                    ),
                                  ),
                                ],
                                rows: _factors
                                    .map(
                                      (factor) => DataRow(
                                        cells: [
                                          DataCell(
                                            Row(
                                              children: [
                                                Icon(Icons.circle,
                                                    size: 12,
                                                    color: Colors.indigo),
                                                SizedBox(width: 8),
                                                Text("${factor['factor']}"),
                                              ],
                                            ),
                                          ),
                                          DataCell(Text("${factor['power']}")),
                                        ],
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Expanded(
                      child: Center(
                        child: Text(
                          "Introduce un número para calcular la factorización.",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
