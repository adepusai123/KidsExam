import 'package:flutter/material.dart';
import 'package:kids_exam/models/questions.dart';
import 'package:kids_exam/screens/exam/components/quiz.dart';
import 'package:kids_exam/screens/exam/components/result.dart';
import 'package:kids_exam/utils/database_helper.dart';

class ExamScreen extends StatefulWidget {
  @override
  _ExamScreenState createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  DatabaseHelper _dbHelper;
  List<Question> _questions = [];
  int totalScore = 0;
  int qIndex = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      _dbHelper = DatabaseHelper.instance;
    });
    _refreshQuestionList();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.deepPurple[100],
      width: double.infinity,
      height: size.height,
      padding: EdgeInsets.all(10),
      child: qIndex < _questions.length
          ? Quiz(
              questions: _questions,
              index: qIndex,
              press: calcTotalScore,
            )
          : Result(press: resetQuiz, score: totalScore),
    );
  }

  void calcTotalScore(score) {
    totalScore += score;
    setState(() {
      qIndex += 1;
    });
  }

  void resetQuiz() {
    setState(() {
      totalScore = 0;
      qIndex = 0;
    });
  }

  _refreshQuestionList() async {
    List<Question> x = await _dbHelper.fetchQuestions();
    setState(() {
      _questions = x;
    });
  }
}
