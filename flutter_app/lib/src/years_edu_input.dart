import 'package:flutter/material.dart';
import 'package:flutter_app/src/gender_input.dart';
import 'package:flutter_app/src/mental_exam.dart';

class YearsEduInput extends StatefulWidget {
  const YearsEduInput({Key? key}) : super(key: key);

  static const String routeName = "/years_edu_input";

  @override
  _YearsEduInputState createState() => _YearsEduInputState();
}

class _YearsEduInputState extends State<YearsEduInput> {

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
                    // todo: update global app state
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Years of education'),
                )),
            ElevatedButton( onPressed: () {
              WidgetsBinding.instance!.addPostFrameCallback((_) {
                Navigator.pushNamed(context, MentalExam.routeName);
              });
            }, child: const Text('Next'),)
          ],
        ),
      ),
    );
  }
}
