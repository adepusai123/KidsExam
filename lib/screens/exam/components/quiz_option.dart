import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  final String labelText;
  final String answer;
  final Function press;

  const Options({
    Key key,
    this.labelText,
    this.answer,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity * 0.5,
      child: RaisedButton(
        color: Colors.deepPurple[400],
        onPressed: press,
        child: Text(
          labelText,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
