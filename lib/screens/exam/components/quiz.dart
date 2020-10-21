import 'package:flutter/material.dart';
import 'package:kids_exam/models/questions.dart';
// import 'package:kids_exam/screens/exam/components/quiz_option.dart';
import 'package:kids_exam/screens/exam/components/quiz_question.dart';

class Quiz extends StatelessWidget {
  final int index;
  final Function press;
  const Quiz({
    Key key,
    @required List<Question> questions,
    this.index,
    this.press,
  })  : _questions = questions,
        super(key: key);

  final List<Question> _questions;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        QuizQuestion(
          question: _questions[index].question,
          options: _questions[index].options,
          answer: _questions[index].answer,
          press: press,
        ),
      ],
    );
  }
}
