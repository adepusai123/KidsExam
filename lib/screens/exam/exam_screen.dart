import 'package:flutter/material.dart';

class ExamScreen extends StatefulWidget {
  @override
  _ExamScreenState createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.deepPurple[100],
      width: double.infinity,
      height: size.height,
      padding: EdgeInsets.all(10),
      child: Text('Exam Here'),
    );
  }
}
