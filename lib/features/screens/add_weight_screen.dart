import 'package:flutter/material.dart';
import 'package:flutter_application_3/features/workouts/models/weight_model.dart';

class AddWeightScreen extends StatefulWidget{
  const AddWeightScreen({super.key});

  @override
  State<AddWeightScreen> createState() => _AddWeightScreenState();
}

class _AddWeightScreenState extends State<AddWeightScreen>{
  final _formKey = GlobalKey<FormState>();

  final _fechaController = TextEditingController();
  final _pesoKilosController = TextEditingController();

  void _saveWeight() {
  if (_formKey.currentState!.validate()) {
    final newWeight = WeightModel(
      fecha: _fechaController.text,
      pesoKilos: double.parse(_pesoKilosController.text),
    );

    Navigator.pop(context, newWeight);
  }
}

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Añadir peso'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _fechaController,
                decoration: InputDecoration(
                  labelText: 'Fecha',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.calendar_today),
                ),
                validator: (value){
                  if(value == null || value.trim().isEmpty){
                    return 'Por favor, ingresa una fecha';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _pesoKilosController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Peso (kg)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.fitness_center),
                ),
                validator: (value){
                  if(value == null || value.trim().isEmpty){
                    return 'Por favor, ingresa un peso';
                  }
                  final weight = double.tryParse(value);
                  if(weight == null || weight <= 0){
                    return 'Por favor, ingresa un peso válido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _saveWeight,
                child: Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
