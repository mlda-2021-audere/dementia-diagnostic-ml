import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/src/global_store.dart';
import 'package:provider/provider.dart';

class Results extends StatefulWidget {
  const Results({Key? key}) : super(key: key);

  static const String routeName = "/results";

  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    int score = Provider.of<GlobalState>(context).getScore();
    int finalScore = 20;
    return Scaffold(
      appBar: AppBar(title: const Text('Results')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Here are the test results'),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '$score/$finalScore',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 30),
                )),
            ElevatedButton(
              onPressed: () {
                WidgetsBinding.instance!.addPostFrameCallback((_) {
                  Navigator.pushNamed(context, MyHomePage.routeName);
                });
              },
              child: const Text('Exit Test'),
            )
          ],
        ),
      ),
    );
  }
}
