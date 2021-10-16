import 'package:flutter/material.dart';
import 'package:flutter_app/src/gender_input.dart';

class AgeInput extends StatefulWidget {
  const AgeInput({Key? key}) : super(key: key);

  static const String routeName = "/age_input";

  @override
  _AgeInputState createState() => _AgeInputState();
}

class _AgeInputState extends State<AgeInput> {

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
                // todo: add provider setter method here
                Navigator.pushNamed(context, GenderInput.routeName);
              });
            }, child: const Text('Next'),)
          ],
        ),
      ),
    );
  }
}
