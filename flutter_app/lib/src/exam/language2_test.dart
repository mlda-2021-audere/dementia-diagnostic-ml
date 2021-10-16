import 'package:flutter/material.dart';
import 'package:flutter_app/src/exam/language3_test.dart';
import 'package:flutter_app/src/global_store.dart';
import 'package:provider/provider.dart';

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
          children: <Widget>[
            const Text("Repeat this phrase 'No ifs, ands, or buts'"),
            const Text('.........'),
            const Text("1 point if completed command successfully"),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (text) {
                    print('First text field: $text');
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
                  Navigator.pushNamed(context, Language3Test.routeName);
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
