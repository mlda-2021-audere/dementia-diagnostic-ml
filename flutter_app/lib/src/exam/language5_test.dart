import 'package:flutter/material.dart';
import 'package:flutter_app/src/exam/results.dart';
import 'package:flutter_app/src/global_store.dart';
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
          children: <Widget>[
            const Text("Please write a sentence!"),
            const Text('.........'),
            const Text("1 point if sensible and has a subject and verb"),
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
                  Navigator.pushNamed(context, Results.routeName);
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
