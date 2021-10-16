import 'package:flutter/material.dart';
import 'package:flutter_app/src/exam/results.dart';
import 'package:flutter_app/src/global_store.dart';
import 'package:flutter_app/src/widgets/radio_points.dart';
import 'package:provider/provider.dart';

class Language5Test extends StatefulWidget {
  const Language5Test({Key? key}) : super(key: key);

  static const String routeName = "/language5_test";

  @override
  _Language5TestState createState() => _Language5TestState();
}

class _Language5TestState extends State<Language5Test> {
  int numCorrect = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Language Test part 5')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text("Please form a sentence!"),
            Text("1 point if sensible and has a subject and verb"),
            RadioPoints(maxPoints: 1, nextRouteName: Results.routeName)
          ],
        ),
      ),
    );
  }
}
