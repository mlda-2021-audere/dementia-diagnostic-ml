import 'package:flutter/material.dart';
import 'package:flutter_app/src/exam/calculation_test.dart';
import 'package:flutter_app/src/global_store.dart';
import 'package:flutter_app/src/widgets/radio_points.dart';
import 'package:provider/provider.dart';

class RegistrationTest extends StatefulWidget {
  const RegistrationTest({Key? key}) : super(key: key);

  static const String routeName = "/registration_test";

  @override
  _RegistrationTestState createState() => _RegistrationTestState();
}

class _RegistrationTestState extends State<RegistrationTest> {
  int numCorrect = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registration test')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('Repeat these three objects three times:'),
            Text('Apple'),
            Text('Table'),
            Text('Coin'),
            Text('1 point for each object repeated thrice'),
            RadioPoints(maxPoints: 3, nextRouteName: CalculationTest.routeName)
          ],
        ),
      ),
    );
  }
}
