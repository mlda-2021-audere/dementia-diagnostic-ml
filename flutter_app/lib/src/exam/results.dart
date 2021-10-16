import 'dart:math';

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
    String gender = Provider.of<GlobalState>(context).getGender();
    int age = Provider.of<GlobalState>(context).getAge();
    int yearsEdu = Provider.of<GlobalState>(context).getYearsEducated();

    int finalScore = 30;

    int G = gender == 'male' ? 1 : 0;

    double Z = -38.56704 -
        0.06486 * G +
        0.06486 * age +
        0.13522 * yearsEdu +
        1.15790 * score;

    double prob = 1 / (1 + pow(e, -Z));

    String probDisplayText = prob <= 0.5 ? 'High Chance' : 'Low Chance';

    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Results'),
            automaticallyImplyLeading: false,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Text(
                //     'age: $age \ngender: $gender \nyearsEdu: $yearsEdu \n\nZ: $Z, prob: $prob'),
                const Text('Here are the test results'),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '$score/$finalScore',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30),
                    )),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text('Your probability:'),
                        Text(
                          probDisplayText,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 34),
                        ),
                        const Text('of dementia')
                      ]),
                ),
                ElevatedButton(
                  onPressed: () {
                    WidgetsBinding.instance!.addPostFrameCallback((_) {
                      Provider.of<GlobalState>(context, listen: false)
                          .resetState();
                      Navigator.pushNamed(context, MyHomePage.routeName);
                    });
                  },
                  child: const Text('Exit Test'),
                )
              ],
            ),
          ),
        ));
  }
}
