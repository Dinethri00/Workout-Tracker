// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:workout_tracker/components/heat_map.dart';
//
// import '../data/workout_data.dart';
// import 'workout_page.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   final newWorkoutNameController = TextEditingController(); // Declare the controller
//
//   @override
//   void initState() {
//     super.initState();
//
//
//     Provider.of<WorkoutData>(context, listen: false).initializedWorkoutList();// Initialize the controller
//   }
//   //final newWorkoutNameController = TextEditingController();
//   @override
//   void dispose() {
//     newWorkoutNameController.dispose(); // Dispose the controller when the state is disposed
//     super.dispose();
//
//   }
//
//   void createNewWorkout() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text("Create New Workout"),
//         content: TextField(
//           controller: newWorkoutNameController,
//         ),
//         actions: [
//           MaterialButton(
//             onPressed: save,
//             child: const Text("Save"),
//           ),
//           MaterialButton(
//             onPressed: cancel,
//             child: const Text("Cancel"),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void goToWorkoutPage(String workoutName){
//     Navigator.push(context, MaterialPageRoute(builder: (context)=>WorkoutPage(workoutName: workoutName),));
//
//   }
//
//   void save() {
//     String newWorkoutName = newWorkoutNameController.text;
//     Provider.of<WorkoutData>(context, listen: false).addWorkout(newWorkoutName);
//
//     Navigator.pop(context);
//     clear();
//   }
//
//   void cancel() {
//     Navigator.pop(context);
//     clear();
//   }
//
//   void clear() {
//     newWorkoutNameController.clear(); // Clear the text field
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<WorkoutData>(
//       builder: (context, value, child) => Scaffold(
//         backgroundColor: Colors.grey[500],
//         appBar: AppBar(
//           backgroundColor: Colors.black,
//           title: const Text('Workout Tracker'),
//         ),
//         floatingActionButton: FloatingActionButton(
//           backgroundColor: Colors.black,
//           onPressed: createNewWorkout,
//           child: const Icon(Icons.add),
//         ),
//         body: ListView(
//           children: [
//             //heat map
//             MyHeatMap(datasets: value.heatMapDataSet, startDateYYYYMMDD: value.getStartDate()),
//             //workout list
//             ListView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: value.getWorkoutList().length,
//               itemBuilder: (context, index) => ListTile(
//                 title: Text(value.getWorkoutList()[index].name),
//                 trailing: IconButton(icon: const Icon(Icons.arrow_forward_ios),
//                   onPressed: () =>
//                       goToWorkoutPage(value.getWorkoutList()[index].name),
//                 ),
//               ),
//             ),
//           ],
//         )
//
//
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_tracker/components/heat_map.dart';

import '../data/workout_data.dart';
import 'workout_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final newWorkoutNameController = TextEditingController(); // Declare the controller

  @override
  void initState() {
    super.initState();

    Provider.of<WorkoutData>(context, listen: false).initializedWorkoutList(); // Initialize the controller
  }

  @override
  void dispose() {
    newWorkoutNameController.dispose(); // Dispose the controller when the state is disposed
    super.dispose();
  }

  void createNewWorkout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Create New Workout"),
        content: TextField(
          controller: newWorkoutNameController,
        ),
        actions: [
          MaterialButton(
            onPressed: save,
            child: const Text("Save"),
          ),
          MaterialButton(
            onPressed: cancel,
            child: const Text("Cancel"),
          ),
        ],
      ),
    );
  }

  void goToWorkoutPage(String workoutName) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WorkoutPage(workoutName: workoutName)),
    );
  }

  void save() {
    String newWorkoutName = newWorkoutNameController.text;
    Provider.of<WorkoutData>(context, listen: false).addWorkout(newWorkoutName);

    Navigator.pop(context);
    clear();
  }

  void cancel() {
    Navigator.pop(context);
    clear();
  }

  void clear() {
    newWorkoutNameController.clear(); // Clear the text field
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutData>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.grey[500],
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Workout Tracker'),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: createNewWorkout,
          child: const Icon(Icons.add),
        ),
        body: ListView(
          children: [
            // Heat map
            MyHeatMap(datasets: value.heatMapDataSet, startDateYYYYMMDD: value.getStartDate()),
            // Workout list
            ListView.builder(
              padding: const EdgeInsets.all(20),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: value.getWorkoutList().length,
              itemBuilder: (context, index) => Card(
                color: Colors.black,
                child: ListTile(
                  title: Text(
                    value.getWorkoutList()[index].name,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  trailing: IconButton(
                    color: Colors.white,
                    icon: const Icon(Icons.arrow_forward_ios),
                    onPressed: () => goToWorkoutPage(value.getWorkoutList()[index].name),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
