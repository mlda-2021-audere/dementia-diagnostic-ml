import 'package:flutter/material.dart';
import 'package:flutter_app/src/age_input.dart';
import 'package:flutter_app/src/exam/registration_test.dart';
import 'package:flutter_app/src/gender_input.dart';
import 'package:flutter_app/src/mental_exam.dart';
import 'package:flutter_app/src/years_edu_input.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var routes = <String, WidgetBuilder>{
      AgeInput.routeName: (BuildContext context) => const AgeInput(),
      GenderInput.routeName: (BuildContext context) => const GenderInput(),
      YearsEduInput.routeName: (BuildContext context) => const YearsEduInput(),
      MentalExam.routeName: (BuildContext context) => const MentalExam(),
      RegistrationTest.routeName: (BuildContext context) => const RegistrationTest(),
    };
    return MaterialApp(
      title: 'Dementia Diagnostic Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Dementia Diagnostic Test'),
      routes: routes,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Please ensure you are conducting this test with someone supervising!',
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  WidgetsBinding.instance!.addPostFrameCallback((_) {
                    Navigator.pushNamed(context, AgeInput.routeName);
                  });
                },
                child: const Text('Start')),
          ],
        ),
      ),
    );
  }
}

class Route {
  final String name;
  final String route;
  final WidgetBuilder builder;

  const Route({required this.name, required this.route, required this.builder});
}