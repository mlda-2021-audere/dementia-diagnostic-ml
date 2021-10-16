import 'package:flutter/material.dart';
import 'package:flutter_app/src/gender_input.dart';
import 'package:flutter_app/src/global_store.dart';
import 'package:flutter_app/src/mental_exam.dart';
import 'package:provider/provider.dart';

class YearsEduInput extends StatefulWidget {
  const YearsEduInput({Key? key}) : super(key: key);

  static const String routeName = "/years_edu_input";

  @override
  _YearsEduInputState createState() => _YearsEduInputState();
}

class _YearsEduInputState extends State<YearsEduInput> {

  int yearsEducated = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Years Educated Input')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Please input the number of years educated here'),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (text) {
                    yearsEducated = int.parse(text);
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Years of education'),
                )),
            ElevatedButton(onPressed: () {
              WidgetsBinding.instance!.addPostFrameCallback((_) {
                Provider.of<GlobalState>(context, listen: false)
                    .setYearsEducated(yearsEducated);
                Navigator.pushNamed(context, MentalExam.routeName);
              });
            }, child: const Text('Next'),)
          ],
        ),
      ),
    );
  }
}
