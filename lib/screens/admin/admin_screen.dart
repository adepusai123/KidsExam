import 'package:flutter/material.dart';
import 'package:kids_exam/components/textFormField.dart';
import 'package:kids_exam/models/questions.dart';
import 'package:kids_exam/screens/admin/components/questions_screen.dart';
import 'package:kids_exam/utils/database_helper.dart';

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  DatabaseHelper dbHelper;

  final _formKey = GlobalKey<FormState>();
  final _ctrlQuestion = TextEditingController();
  final _ctrlOptions = TextEditingController();
  final _ctrlAnswer = TextEditingController();

  Question _question = Question();

  @override
  void initState() {
    super.initState();
    setState(() {
      dbHelper = DatabaseHelper.instance;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.deepPurple[100],
      width: double.infinity,
      height: size.height,
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  FormTextField(
                    ctrlInput: _ctrlQuestion,
                    labelText: 'Question',
                    onSaved: (val) {
                      setState(() {
                        _question.question = val;
                      });
                    },
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'This field is required.';
                      }
                      return null;
                    },
                  ),
                  FormTextField(
                    ctrlInput: _ctrlOptions,
                    labelText: 'Options (,seperated values)',
                    onSaved: (val) {
                      setState(() {
                        _question.options = val;
                      });
                    },
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'This field is required.';
                      }
                      return null;
                    },
                  ),
                  FormTextField(
                    ctrlInput: _ctrlAnswer,
                    labelText: 'Answer',
                    onSaved: (val) {
                      setState(() {
                        _question.answer = val;
                      });
                    },
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'This field is required.';
                      }
                      return null;
                    },
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: RaisedButton(
                      color: Colors.deepPurple[400],
                      onPressed: () => _onSubmit(),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _onSubmit() async {
    var form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      await dbHelper.insertQuestion(_question);
    }
    _resetForm();
  }

  _resetForm() {
    setState(() {
      _formKey.currentState.reset();
      _ctrlQuestion.clear();
      _ctrlOptions.clear();
      _ctrlAnswer.clear();
    });
  }
}
