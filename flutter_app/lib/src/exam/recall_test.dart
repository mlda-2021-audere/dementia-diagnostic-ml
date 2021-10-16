import 'package:flutter/material.dart';
import 'package:flutter_app/src/exam/language1_test.dart';
import 'package:flutter_app/src/global_store.dart';
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
          children: <Widget>[
            const Text('What were the three objects named earlier?'),
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
                  Navigator.pushNamed(context, Language1Test.routeName);
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
