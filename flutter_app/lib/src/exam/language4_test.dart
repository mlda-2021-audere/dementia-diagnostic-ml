import 'package:flutter/material.dart';
import 'package:flutter_app/src/exam/language5_test.dart';
import 'package:flutter_app/src/global_store.dart';
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
          children: <Widget>[
            const Text("Read and do this command:"),
            const Text("Close your eyes"),
            const Text('.........'),
            const Text("1 point if completed command successfully"),
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
                  Navigator.pushNamed(context, Language5Test.routeName);
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
