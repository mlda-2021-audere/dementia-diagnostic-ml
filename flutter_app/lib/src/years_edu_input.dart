import 'package:flutter/material.dart';
import 'package:flutter_app/src/global_store.dart';
import 'package:flutter_app/src/mental_exam.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';

class YearsEduInput extends StatefulWidget {
  const YearsEduInput({Key? key}) : super(key: key);

  static const String routeName = "/years_edu_input";

  @override
  _YearsEduInputState createState() => _YearsEduInputState();
}

class _YearsEduInputState extends State<YearsEduInput> {
  int _currentIntValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Years Educated Input')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Please input the number of years educated here'),
            NumberPicker(
              value: _currentIntValue,
              minValue: 0,
              maxValue: 40,
              step: 1,
              haptics: true,
              onChanged: (value) => setState(() => _currentIntValue = value),
            ),
            ElevatedButton(onPressed: () {
              WidgetsBinding.instance!.addPostFrameCallback((_) {
                Provider.of<GlobalState>(context, listen: false)
                    .setYearsEducated(_currentIntValue);
                Navigator.pushNamed(context, MentalExam.routeName);
              });
            }, child: const Text('Next'),)
          ],
        ),
      ),
    );
  }
}
