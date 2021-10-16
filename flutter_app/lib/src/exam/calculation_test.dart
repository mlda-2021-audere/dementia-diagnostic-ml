import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/src/exam/recall_test.dart';
import 'package:flutter_app/src/global_store.dart';
import 'package:flutter_app/src/widgets/radio_points.dart';
import 'package:provider/provider.dart';

class CalculationTest extends StatefulWidget {
  const CalculationTest({Key? key}) : super(key: key);

  static const String routeName = "/calculation_test";

  @override
  _CalculationTestState createState() => _CalculationTestState();
}

class _CalculationTestState extends State<CalculationTest> {
  String num1 = _rangedRng().toString();
  String num2 = _rangedRng().toString();
  String num3 = _rangedRng().toString();
  String num4 = _rangedRng().toString();
  String num5 = _rangedRng().toString();

  @override
  Widget build(BuildContext context) {
    int numCorrect = 0;
    return Scaffold(
      appBar: AppBar(title: const Text('Calculation test')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('What is 100 - $num1 ?'),
            Text('What is 90 - $num2 ?'),
            Text('What is 80 - $num3 ?'),
            Text('What is 70 - $num4 ?'),
            Text('What is 60 - $num5 ?'),
            const Text('1 point for each correct answer'),
            const RadioPoints(maxPoints: 5, nextRouteName: RecallTest.routeName)
          ],
        ),
      ),
    );
  }
}

_rangedRng() {
  int min = 1;
  int max = 10;
  return min + Random().nextInt(max - min);
}
