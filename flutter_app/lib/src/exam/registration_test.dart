import 'package:flutter/material.dart';
import 'package:flutter_app/src/exam/calculation_test.dart';

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
            const Text('Repeat these three objects:'),
            const Text('Apple'),
            const Text('Table'),
            const Text('Coin'),
            const Text('1 point for each object repeated thrice'),
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
                  Navigator.pushNamed(context, CalculationTest.routeName);
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
