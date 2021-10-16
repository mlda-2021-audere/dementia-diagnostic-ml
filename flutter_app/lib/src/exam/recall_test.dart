import 'package:flutter/material.dart';
import 'package:flutter_app/src/exam/language1_test.dart';

class RecallTest extends StatefulWidget {
  const RecallTest({Key? key}) : super(key: key);

  static const String routeName = "/recall_test";

  @override
  _RecallTestState createState() => _RecallTestState();
}

class _RecallTestState extends State<RecallTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registration test')),
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
                    print('First text field: $text');
                    // todo: update global app state
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Age'),
                )),
            ElevatedButton(
              onPressed: () {
                WidgetsBinding.instance!.addPostFrameCallback((_) {
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
