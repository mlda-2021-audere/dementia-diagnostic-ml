import 'package:flutter/material.dart';
import 'package:flutter_app/src/exam/registration_test.dart';

class OrientationTest extends StatefulWidget {
  const OrientationTest({Key? key}) : super(key: key);

  static const String routeName = "/orientation_test";

  @override
  _OrientationTestState createState() => _OrientationTestState();
}

var genders = <String>['male', 'female', 'other', 'prefer not to say'];

class _OrientationTestState extends State<OrientationTest> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue = genders[0];

    return Scaffold(
      appBar: AppBar(title: const Text('Orientation Test (MMSE)')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("What is today's date?"),
            const Text('What is your name?'),
            const Text('What country are you in?'),
            const Text('How many questions did they get correct?'),
            Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (text) {
                    // todo: update global app state
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Age'),
                )),
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
