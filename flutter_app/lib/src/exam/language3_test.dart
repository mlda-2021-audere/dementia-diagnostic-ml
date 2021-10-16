import 'package:flutter/material.dart';
import 'package:flutter_app/src/exam/language4_test.dart';

class Language3Test extends StatefulWidget {
  const Language3Test({Key? key}) : super(key: key);

  static const String routeName = "/language3_test";

  @override
  _Language3TestState createState() => _Language3TestState();
}

class _Language3TestState extends State<Language3Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Language Test part 3')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Place your left index finger on your ear"),
            const Text("Place your right index finger on your chin"),
            const Text("Place your right index finger on your knee"),
            const Text('.........'),
            const Text("+1 point for each successful command"),
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
                  Navigator.pushNamed(context, Language4Test.routeName);
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
