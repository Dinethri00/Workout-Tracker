

import '../models/workout.dart';

class HiveDatabase{

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
    List

  }
}
