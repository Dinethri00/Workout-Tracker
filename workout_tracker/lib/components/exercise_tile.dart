import 'package:flutter/material.dart';

class ExerciseTile extends StatelessWidget {
  final String exerciseName;
  final String weight;
  final String reps;
  final String sets;
  final bool isCompleted;
  void Function(bool?)? onCheckBoxChanged;

  ExerciseTile({
    super.key,
    required this.exerciseName,
    required this.weight,
    required this.reps,
    required this.sets,
    required this.isCompleted,
    required this.onCheckBoxChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: ListTile(
        title: Text(exerciseName),
        subtitle: Row(
          children: [
            SizedBox(
              height: 80,
            ),
            //weight
            Chip(
              label: Text("${weight}kg"),
            ),

            //reps
            Chip(
              label: Text("$reps reps"),
            ),

            //sets
            Chip(
              label: Text("$sets sets"),
            ),
          ],
        ),
        trailing: Checkbox(
          value: isCompleted,
          activeColor: Colors.black,
          onChanged: (value) => onCheckBoxChanged!(value),
        ),
      ),
    );
  }
}
