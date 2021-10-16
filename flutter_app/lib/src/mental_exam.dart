import 'package:flutter/material.dart';
import 'package:flutter_app/src/exam/registration_test.dart';
import 'package:flutter_app/src/years_edu_input.dart';

class MentalExam extends StatefulWidget {
  const MentalExam({Key? key}) : super(key: key);

  static const String routeName = "/mental_exam";

  @override
  _MentalExamState createState() => _MentalExamState();
}

var genders = <String>['male', 'female', 'other', 'prefer not to say'];

class _MentalExamState extends State<MentalExam> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue = genders[0];

    return Scaffold(
      appBar: AppBar(title: const Text('Mini-mental state')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Mini-mental state examination'),
            const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('............')), // todo
            ElevatedButton(
              onPressed: () {
                WidgetsBinding.instance!.addPostFrameCallback((_) {
                  Navigator.pushNamed(context, RegistrationTest.routeName);
                });
              },
              child: const Text('Next'),
            )
          ],
        ),
      ),
    );
  }
}
