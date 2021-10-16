import 'package:flutter/material.dart';
import 'package:flutter_app/src/exam/language3_test.dart';
import 'package:flutter_app/src/widgets/radio_points.dart';

class Language2Test extends StatefulWidget {
  const Language2Test({Key? key}) : super(key: key);

  static const String routeName = "/language2_test";

  @override
  _Language2TestState createState() => _Language2TestState();
}

class _Language2TestState extends State<Language2Test> {
  int numCorrect = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Language Test part 2')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text("Repeat this phrase 'No ifs, ands, or buts'"),
            Text("1 point if completed command successfully"),
            RadioPoints(maxPoints: 1, nextRouteName: Language3Test.routeName)
          ],
        ),
      ),
    );
  }
}
