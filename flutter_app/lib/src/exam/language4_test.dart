import 'package:flutter/material.dart';
import 'package:flutter_app/src/exam/language5_test.dart';
import 'package:flutter_app/src/global_store.dart';
import 'package:flutter_app/src/widgets/radio_points.dart';
import 'package:provider/provider.dart';

class Language4Test extends StatefulWidget {
  const Language4Test({Key? key}) : super(key: key);

  static const String routeName = "/language4_test";

  @override
  _Language4TestState createState() => _Language4TestState();
}

class _Language4TestState extends State<Language4Test> {
  int numCorrect = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Language Test part 4')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text("Read and do this command:"),
            Text("Close your eyes"),
            Text("1 point if completed command successfully"),
            RadioPoints(maxPoints: 1, nextRouteName: Language5Test.routeName)
          ],
        ),
      ),
    );
  }
}
