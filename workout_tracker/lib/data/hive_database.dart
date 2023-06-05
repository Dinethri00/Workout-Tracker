import 'package:hive_flutter/hive_flutter.dart';
import 'package:workout_tracker/datetime/date_time.dart';
import 'package:workout_tracker/models/exercise.dart';
import '../models/workout.dart';

class HiveDatabase{

  final _myBox = Hive.box("workout_database1");

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

String getStartDate(){
 return _myBox.get("START DATE");
}

//write data
void saveToDatabase(List<Workout> workouts){
  final workoutList = convertObjectToWorkoutList(workouts);
  final exerciseList = convertObjectToExerciseList(workouts);


  if (exerciseCompleted(workouts)){
    _myBox.put("COMPLETION STATUS_${todaysDateYYYYMMDD()}", 1);

  }else{
    _myBox.put("COMPLETION STATUS_${todaysDateYYYYMMDD()}", 0);

  }
  
  //save into hive
  _myBox.put("WORKOUTS", workoutList);
  _myBox.put("EXERCISE", exerciseList);

}

//read data
  List<Workout> readFromDatabase(){
    List<Workout> mySavedWorkouts = [];

    List<String> workoutNames = _myBox.get("WORKOUTS");
    final exerciseDetails = _myBox.get("EXERCISE");


    for (int i=0; i<workoutNames.length; i++){
      List<Exercise> exerciseInEachWorkout = [];

      for (int j=0; j<exerciseDetails[i].length; j++){
        exerciseInEachWorkout.add(
          Exercise(
              name: exerciseDetails[i][j][0],
              weight: exerciseDetails[i][j][1],
              reps: exerciseDetails[i][j][2],
              sets: exerciseDetails[i][j][3],
              isCompleted: exerciseDetails[i][j][4] == "true" ? true : false,
          ),
        );

      }

      //create individual workout
      Workout workout =
          Workout(name: workoutNames[i], exercises: exerciseInEachWorkout);
      mySavedWorkouts.add(workout);
    }
    return mySavedWorkouts;
  }

  bool exerciseCompleted(List<Workout> workouts) {
    for (var workout in workouts){
      for (var exercise in workout.exercises){
        if (exercise.isCompleted){
          return true;
        }
      }
    }
    return false;
  }

  int getCompletionStatus(String yyyymmdd){
    int completionStatus = _myBox.get("COMPLETION STATUS_$yyyymmdd") ?? 0;
    return completionStatus;

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
