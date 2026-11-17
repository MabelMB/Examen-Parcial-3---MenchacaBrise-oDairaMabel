import 'package:flutter/material.dart';
import 'package:flutter_application_3/features/workouts/models/workout_model.dart';

class DetailsScreen extends StatelessWidget{
  final WorkoutModel workout;
  const DetailsScreen({super.key, required this.workout});

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
        title: Text(workout.title),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Categoría: ${workout.category}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Duración: ${workout.durationMinutes}',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          ),

    );
  }
}