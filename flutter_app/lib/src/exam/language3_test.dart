import 'package:flutter/material.dart';
import 'package:flutter_app/src/exam/language4_test.dart';
import 'package:flutter_app/src/global_store.dart';
import 'package:flutter_app/src/widgets/radio_points.dart';
import 'package:provider/provider.dart';

class Language3Test extends StatefulWidget {
  const Language3Test({Key? key}) : super(key: key);

  static const String routeName = "/language3_test";

  @override
  _Language3TestState createState() => _Language3TestState();
}

class _Language3TestState extends State<Language3Test> {
  int numCorrect = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Language Test part 3')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text("Place your left index finger on your ear"),
            Text("Place your right index finger on your chin"),
            Text("Place your right index finger on your knee"),
            Text("1 point for each successful command"),
            RadioPoints(maxPoints: 3, nextRouteName: Language4Test.routeName)
          ],
        ),
      ),
    );
  }
}
