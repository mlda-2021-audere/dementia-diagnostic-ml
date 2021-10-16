import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/src/gender_input.dart';

class Results extends StatefulWidget {
  const Results({Key? key}) : super(key: key);

  static const String routeName = "/results";

  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Age Input')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Please input your age here'),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (text) {
                    print('First text field: $text');
                    // todo: update global app state
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Age'),
                )),
            ElevatedButton( onPressed: () {
              WidgetsBinding.instance!.addPostFrameCallback((_) {
                Navigator.pushNamed(context, MyHomePage.routeName);
              });
            }, child: const Text('Next'),)
          ],
        ),
      ),
    );
  }
}
