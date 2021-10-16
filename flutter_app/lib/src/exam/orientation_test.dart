import 'package:flutter/material.dart';
import 'package:flutter_app/src/exam/registration_test.dart';
import 'package:flutter_app/src/global_store.dart';
import 'package:flutter_app/src/widgets/radio_points.dart';
import 'package:provider/provider.dart';

class OrientationTest extends StatefulWidget {
  const OrientationTest({Key? key}) : super(key: key);

  static const String routeName = "/orientation_test";

  @override
  _OrientationTestState createState() => _OrientationTestState();
}

var genders = <String>['male', 'female', 'other', 'prefer not to say'];

class _OrientationTestState extends State<OrientationTest> {
  int numCorrect = 0;

  @override
  Widget build(BuildContext context) {
    String dropdownValue = genders[0];

    return Scaffold(
      appBar: AppBar(title: const Text('Orientation Test (MMSE)')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text("What is today's date?"),
            Text('What is your name?'),
            Text('What country are you in?'),
            Text('What is the time now?'),
            Text('Where are you now'),
            Text('How many questions did they get correct? 2 points per question'),
            RadioPoints(
                maxPoints: 10, nextRouteName: RegistrationTest.routeName)
          ],
        ),
      ),
    );
  }
}
