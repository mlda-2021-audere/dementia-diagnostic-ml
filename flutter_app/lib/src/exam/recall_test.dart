import 'package:flutter/material.dart';
import 'package:flutter_app/src/exam/language1_test.dart';
import 'package:flutter_app/src/global_store.dart';
import 'package:flutter_app/src/widgets/radio_points.dart';
import 'package:provider/provider.dart';

class RecallTest extends StatefulWidget {
  const RecallTest({Key? key}) : super(key: key);

  static const String routeName = "/recall_test";

  @override
  _RecallTestState createState() => _RecallTestState();
}

class _RecallTestState extends State<RecallTest> {
  int numCorrect = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recall test')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('What were the three objects named earlier?'),
            Text('1 point for each object recalled correctly'),
            RadioPoints(maxPoints: 3, nextRouteName: Language1Test.routeName)
          ],
        ),
      ),
    );
  }
}
