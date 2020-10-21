import 'package:flutter/material.dart';
import 'package:kids_exam/screens/exam/components/quiz_option.dart';

class QuizQuestion extends StatelessWidget {
  final String question;
  final String options;
  final String answer;
  final Function press;
  const QuizQuestion(
      {Key key,
      // @required List<Question> questions,
      this.question,
      this.options,
      this.answer,
      this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          question,
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Colors.deepPurple[900],
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        ...?options
            .split(',')
            .map((e) => Options(
                  labelText: e,
                  answer: answer,
                  press: () =>
                      press(e.toLowerCase() == answer.toLowerCase() ? 1 : 0),
                ))
            .toList()
      ],
    );
  }
}
