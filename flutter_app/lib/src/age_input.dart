//packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

// routes
import 'package:flutter_app/src/global_store.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/src/gender_input.dart';

class AgeInput extends StatefulWidget {
  const AgeInput({Key? key}) : super(key: key);

  static const String routeName = "/age_input";

  @override
  _AgeInputState createState() => _AgeInputState();
}

class _AgeInputState extends State<AgeInput> {
  late int age; // todo: remove
  int _currentIntValue = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Age Input')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Please input your age here'),
            NumberPicker(
              value: _currentIntValue,
              minValue: 60,
              maxValue: 98,
              step: 1,
              haptics: true,
              onChanged: (value) => setState(() => _currentIntValue = value),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                WidgetsBinding.instance!.addPostFrameCallback((_) {
                  Provider.of<GlobalState>(context, listen: false).setAge(_currentIntValue);
                  Navigator.pushNamed(context, GenderInput.routeName);
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
