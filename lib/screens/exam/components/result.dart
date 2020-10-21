import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Function press;
  final int score;
  final int length;
  const Result({
    Key key,
    this.press,
    this.score,
    this.length,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return length != 0
        ? Column(
            children: [
              Text('You are done!'),
              Text('You are Score is $score'),
              RaisedButton(
                onPressed: press,
                child: Text('Restart Quiz'),
              )
            ],
          )
        : RaisedButton(
            onPressed: press,
            child: Text('Load Questions'),
          );
  }
}
