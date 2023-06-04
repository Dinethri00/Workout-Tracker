import 'package:hive_flutter/hive_flutter.dart';
import 'package:workout_tracker/datetime/date_time.dart';
import 'package:workout_tracker/models/exercise.dart';

import '../models/workout.dart';

class HiveDatabase{

  final _myBox = Hive.box("workout_database");

  //check if already data stored, if not record the start date
bool previousDataExists(){
  if (_myBox.isEmpty){
    print("Previous data does not exist");
    _myBox.put("START DATE", todaysDateYYYYMMDD()); 
    return false;
  }else{
    print("Previous data does exist");
    return true;
  }
}

}

List<String> convertObjectToWorkoutList(List<Workout>workouts){
  List<String> workoutList = [

  ];



  for (int i=0; i<workouts.length; i++){
    workoutList.add(
      workouts[i].name,
    );
  }
  return workoutList;
}

//convert exercises in a workout object into a list of strings

List<List<List<String>>> convertObjectToExerciseList(List<Workout>workouts) {
  List<List<List<String>>> exerciseList = [
  ];


//go through each workout
  for (int i = 0; i < workouts.length; i++) {
    //get exercise from each workout
    List<Exercise> exerciseInWorkout = workouts[i].exercises;

    List<List<String>> individualWorkout = [

    ];

    for (int j=0; j<exerciseInWorkout.length; j++){
      List<String> individualExercise = [

      ];
      individualExercise.addAll(
        [
          exerciseInWorkout[j].name,
          exerciseInWorkout[j].weight,
          exerciseInWorkout[j].reps,
          exerciseInWorkout[j].sets,
          exerciseInWorkout[j].isCompleted.toString(),


        ],
      );
      individualWorkout.add(individualExercise);
    }
    exerciseList.add(individualWorkout);

  }
  return exerciseList;
}
