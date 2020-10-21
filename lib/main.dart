import 'package:flutter/material.dart';
import 'package:kids_exam/screens/welcome/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KIDS EXAM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColorLight: Colors.deepPurple[100],
        primaryColorDark: Colors.deepPurple[400],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WelcomeScreen(),
    );
  }
}
