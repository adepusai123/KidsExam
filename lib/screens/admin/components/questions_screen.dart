import 'package:flutter/material.dart';
import 'package:kids_exam/models/questions.dart';
import 'package:kids_exam/utils/database_helper.dart';

class Questions extends StatefulWidget {
  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  DatabaseHelper _dbHelper;
  List<Question> _questions = [];

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
    return Column(
      children: [
        Expanded(
          child: Card(
              child: Column(
            children: [
              ...?_questions.map((e) => ListTile(
                    title: Text(e.question),
                    subtitle: Text(e.options),
                  )),
            ],
          )),
        )
      ],
    );
  }

  _refreshQuestionList() async {
    List<Question> x = await _dbHelper.fetchQuestions();
    setState(() {
      _questions = x;
    });
  }
}
