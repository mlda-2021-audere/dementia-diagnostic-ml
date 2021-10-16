import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/src/exam/recall_test.dart';
import 'package:flutter_app/src/global_store.dart';
import 'package:provider/provider.dart';

class CalculationTest extends StatefulWidget {
  const CalculationTest({Key? key}) : super(key: key);

  static const String routeName = "/calculation_test";

  @override
  _CalculationTestState createState() => _CalculationTestState();
}

class _CalculationTestState extends State<CalculationTest> {
  String num1 = _rangedRng().toString();

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
            const Text('.........'),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (text) {
                    numCorrect = int.parse(text);
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Number correct'),
                )),
            ElevatedButton(
              onPressed: () {
                WidgetsBinding.instance!.addPostFrameCallback((_) {
                  Provider.of<GlobalState>(context, listen: false)
                      .addToScore(numCorrect);
                  Navigator.pushNamed(context, RecallTest.routeName);
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

_rangedRng() {
  int min = 1;
  int max = 10;
  return min + Random().nextInt(max - min);
}
