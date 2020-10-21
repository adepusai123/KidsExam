import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Function press;
  final int score;
  const Result({
    Key key,
    this.press,
    this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('You are done!'),
        Text('You are Score is $score'),
        RaisedButton(
          onPressed: press,
          child: Text('Restart Quiz'),
        )
      ],
    );
  }
}
