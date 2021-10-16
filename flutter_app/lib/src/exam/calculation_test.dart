import 'package:flutter/material.dart';
import 'package:flutter_app/src/exam/recall_test.dart';

class CalculationTest extends StatefulWidget {
  const CalculationTest({Key? key}) : super(key: key);

  static const String routeName = "/calculation_test";

  @override
  _CalculationTestState createState() => _CalculationTestState();
}

class _CalculationTestState extends State<CalculationTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registration test')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('What is 100 - 7?'),
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
