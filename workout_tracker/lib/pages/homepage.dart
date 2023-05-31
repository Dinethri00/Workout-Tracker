import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/workout_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void createNewWorkout(){
    showDialog(context: context,
        builder: (context) => AlertDialog(
          title: Text
            ("Create New Workout"),
          content: TextField(),
          actions: [
            MaterialButton(
              onPressed: save,
              child: Text("save"),
            ),
            MaterialButton(
              onPressed: cancel,
              child: Text("cancel"),
            ),
          ],
        ),
    );

  }

  void save(){}
  void cancel(){}


  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutData>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Text('Workout Tracker'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewWorkout,
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
            itemCount: value.getWorkoutList().length,
            itemBuilder: (context, index) =>  ListTile(
                  title: Text(value.getWorkoutList()[index].name),
                )),
      ),
    );
  }
}
