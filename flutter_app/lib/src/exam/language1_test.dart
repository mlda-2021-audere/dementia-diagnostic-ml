import 'package:flutter/material.dart';
import 'package:flutter_app/src/exam/language2_test.dart';

class Language1Test extends StatefulWidget {
  const Language1Test({Key? key}) : super(key: key);

  static const String routeName = "/language1_test";

  @override
  _Language1TestState createState() => _Language1TestState();
}

class _Language1TestState extends State<Language1Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Language Test part 1')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Name any two objects'),
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
                  Navigator.pushNamed(context, Language2Test.routeName);
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
