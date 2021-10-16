import 'package:flutter/material.dart';
import 'package:flutter_app/src/exam/language2_test.dart';
import 'package:flutter_app/src/global_store.dart';
import 'package:flutter_app/src/widgets/radio_points.dart';
import 'package:provider/provider.dart';

class Language1Test extends StatefulWidget {
  const Language1Test({Key? key}) : super(key: key);

  static const String routeName = "/language1_test";

  @override
  _Language1TestState createState() => _Language1TestState();
}

class _Language1TestState extends State<Language1Test> {
  int numCorrect = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Language Test part 1')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('Name any two random objects'),
            Text('1 point for each correct answer'),
            RadioPoints(maxPoints: 2, nextRouteName: Language2Test.routeName)
          ],
        ),
      ),
    );
  }
}
