import 'package:flutter/cupertino.dart';
import 'package:workout_tracker/data/hive_database.dart';
import 'package:workout_tracker/models/exercise.dart';

import '../models/workout.dart';

class WorkoutData extends ChangeNotifier{
  final db = HiveDatabase();
  List<Workout> workoutList = [
    Workout(
      name: "Upper Body",
      exercises: [
        Exercise(
            name: "Bicep Curls",
            weight: "10",
            reps: "10",
            sets: "3"
        ),
      ],
    ),
    Workout(
      name: "Lower Body",
      exercises: [
        Exercise(
            name: "Squats",
            weight: "10",
            reps: "10",
            sets: "3"
        ),
      ],
    )
  ];

  void initalizedWorkoutList(){
    if (db.previousDataExists()){
      workoutList = db.readFromDatabase();
    }else{
      db.saveToDatabase(workoutList);
    }

  }

  List<Workout> getWorkoutList() {
    return workoutList;
  }

  int numberOfExercisesInWorkout(String workoutName){
    Workout relevantWorkout = getRelevantWorkout(workoutName);

    return relevantWorkout.exercises.length;
  }

  void addWorkout(String name) {
    workoutList.add(Workout(name: name, exercises: []));

    notifyListeners();
    db.saveToDatabase(workoutList);
  }


  void addExercise(String workoutName, String exerciseName, String weight,
      String reps, String sets) {
    Workout relevantWorkout = getRelevantWorkout(workoutName);

    relevantWorkout.exercises.add(
      Exercise(name: exerciseName, weight: weight, reps: reps, sets: sets),
    );
    notifyListeners();
    db.saveToDatabase(workoutList);

  }

  void checkOffExercise(String workoutName, String exerciseName) {

    Exercise relevantExercise = getRelevantExercise(workoutName, exerciseName);
    relevantExercise.isCompleted = !relevantExercise.isCompleted;

    notifyListeners();
    db.saveToDatabase(workoutList);

  }

  Workout getRelevantWorkout(String workoutName) {
    Workout relevantWorkout =
        workoutList.firstWhere((workout) => workout.name == workoutName);

    return relevantWorkout;
  }

  Exercise getRelevantExercise(String workoutName, String exerciseName) {
    Workout relevantWorkout = getRelevantWorkout(workoutName);

    Exercise relevantExercise = relevantWorkout.exercises
        .firstWhere((exercise) => exercise.name == exerciseName);
    return relevantExercise;
  }
}
