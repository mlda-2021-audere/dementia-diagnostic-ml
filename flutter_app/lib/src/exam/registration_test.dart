import 'package:flutter/material.dart';
import 'package:flutter_app/src/gender_input.dart';

class RegistrationTest extends StatefulWidget {
  const RegistrationTest({Key? key}) : super(key: key);

  static const String routeName = "/registration_test";

  @override
  _RegistrationTestState createState() => _RegistrationTestState();
}

class _RegistrationTestState extends State<RegistrationTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registration test')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('What year is it'),
            const Text("What is today's date"),
            const Text('What is the time now'),
            const Text('.........'),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (text) {
                    print('First text field: $text');
                    // todo: update global app state
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Age'),
                )),
            ElevatedButton(
              onPressed: () {
                WidgetsBinding.instance!.addPostFrameCallback((_) {
                  Navigator.pushNamed(context, GenderInput.routeName);
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
