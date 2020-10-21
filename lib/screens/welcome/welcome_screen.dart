import 'package:flutter/material.dart';
import 'package:kids_exam/screens/admin/admin_screen.dart';
import 'package:kids_exam/screens/admin/components/questions_screen.dart';
import 'package:kids_exam/screens/exam/exam_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String _screen = 'exam';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kids Exam'),
        backgroundColor: Colors.deepPurple[400],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              // padding: EdgeInsets.symmetric(vertical: 32),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/header.PNG'),
                    fit: BoxFit.cover,
                  ),
                ),
                // child: Text(
                //   'Welcome Kids',
                //   textAlign: TextAlign.justify,
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontWeight: FontWeight.bold,
                //     fontSize: 36,
                //   ),
                // ),
              ),
              decoration: BoxDecoration(
                color: Colors.deepPurple[400],
              ),
            ),
            ListTile(
              hoverColor: Colors.deepPurple[100],
              autofocus: true,
              title: Text(
                'Exam',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
              onTap: () {
                setState(() {
                  _screen = 'exam';
                });
                Navigator.pop(context);
              },
            ),
            Divider(
              height: 5.0,
              color: Colors.deepPurple[400],
            ),
            ListTile(
              hoverColor: Colors.deepPurple[100],
              autofocus: true,
              title: Text(
                'Questions',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
              onTap: () {
                setState(() {
                  _screen = 'questions';
                });
                Navigator.pop(context);
              },
            ),
            Divider(
              height: 5.0,
              color: Colors.deepPurple[400],
            ),
            ListTile(
              hoverColor: Colors.deepPurple[100],
              autofocus: true,
              title: Text(
                'Add Question',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
              onTap: () {
                setState(() {
                  _screen = 'admin';
                });
                Navigator.pop(context);
              },
            ),
            Divider(
              height: 5.0,
              color: Colors.deepPurple[400],
            ),
          ],
        ),
      ),
      body: _showScreen(),
    );
  }

  _showScreen() {
    if (_screen == 'admin') {
      return AdminScreen();
    } else if (_screen == 'questions') {
      return Questions();
    } else {
      return ExamScreen();
    }
  }
}
