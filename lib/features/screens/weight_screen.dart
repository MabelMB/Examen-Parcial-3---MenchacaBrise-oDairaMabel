import 'package:flutter/material.dart';
import 'package:flutter_application_3/features/screens/add_weight_screen.dart';
import 'package:flutter_application_3/features/workouts/models/weight_model.dart';

class WeightScreen extends StatefulWidget {
  const WeightScreen({super.key});

  @override
  State<WeightScreen> createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  final List<WeightModel> _weights = [];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial de peso'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: _weights.isEmpty ? Center(
              child: Text('No hay registros', style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          :ListView.builder(
              itemCount: _weights.length,
              itemBuilder: (context, index) {
                final weight = _weights[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  elevation: 2,
                  child: ListTile(
                    leading: Icon(Icons.monitor_weight, color: Colors.blueAccent),
                    title: Text('Fecha: ${weight.fecha}'),
                    subtitle: Text('Peso: ${weight.pesoKilos} kg'),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newWeight = await Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => AddWeightScreen()),
          );

          if (newWeight != null && newWeight is WeightModel) {
            setState(() {
              _weights.add(newWeight);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}