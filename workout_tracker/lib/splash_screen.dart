// import 'package:flutter/material.dart';
// import 'package:workout_tracker/pages/homepage.dart';
//
// class Splash extends StatefulWidget {
//   const Splash({Key? key}) : super(key: key);
//
//   @override
//   _SplashState createState() => _SplashState();
// }
//
// class _SplashState extends State<Splash> {
//   @override
//   void initState() {
//     super.initState();
//
//     Future.delayed(const Duration(seconds: 4), () {
//       // After the delay, navigate to the home page
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const HomePage()),
//       );
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body:
//       Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset('images/img1.jpg',
//               height: 400,
//               width: 400,),
//
//             // Image.asset('images/loading.gif',
//             //   height: 55,
//             //   width: 55,),
//           ],
//         ),
//       ),
//     );
//   }
// }