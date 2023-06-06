import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:workout_tracker/data/workout_data.dart';
import 'pages/homepage.dart';
import 'splash_screen.dart';

void main() async {
  //initialize hive
  await Hive.initFlutter();


  //open a hive box
  await Hive.openBox("workout_database1");


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WorkoutData(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        //home: HomePage(),
        home: const Splash(),
      ),
    );
  }
}
