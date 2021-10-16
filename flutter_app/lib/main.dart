// import packages
import 'package:flutter/material.dart';

// import routes
import 'package:flutter_app/src/age_input.dart';
import 'package:flutter_app/src/exam/calculation_test.dart';
import 'package:flutter_app/src/exam/language1_test.dart';
import 'package:flutter_app/src/exam/language2_test.dart';
import 'package:flutter_app/src/exam/language3_test.dart';
import 'package:flutter_app/src/exam/language4_test.dart';
import 'package:flutter_app/src/exam/language5_test.dart';
import 'package:flutter_app/src/exam/orientation_test.dart';
import 'package:flutter_app/src/exam/recall_test.dart';
import 'package:flutter_app/src/exam/registration_test.dart';
import 'package:flutter_app/src/exam/results.dart';
import 'package:flutter_app/src/gender_input.dart';
import 'package:flutter_app/src/global_store.dart';
import 'package:flutter_app/src/mental_exam.dart';
import 'package:flutter_app/src/years_edu_input.dart';
import 'package:provider/provider.dart';

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
      OrientationTest.routeName: (BuildContext context) =>
          const OrientationTest(),
      RegistrationTest.routeName: (BuildContext context) =>
          const RegistrationTest(),
      CalculationTest.routeName: (BuildContext context) =>
          const CalculationTest(),
      RecallTest.routeName: (BuildContext context) => const RecallTest(),
      Language1Test.routeName: (BuildContext context) => const Language1Test(),
      Language2Test.routeName: (BuildContext context) => const Language2Test(),
      Language3Test.routeName: (BuildContext context) => const Language3Test(),
      Language4Test.routeName: (BuildContext context) => const Language4Test(),
      Language5Test.routeName: (BuildContext context) => const Language5Test(),
      Results.routeName: (BuildContext context) => const Results(),
    };
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: GlobalState(),
          ),
        ],
        child: MaterialApp(
          title: 'Dementia Diagnostic Test',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage(title: 'Dementia Diagnostic Test'),
          routes: routes,
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  static const String routeName = "/";

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            automaticallyImplyLeading: false,
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
        ));
  }
}

class Route {
  final String name;
  final String route;
  final WidgetBuilder builder;

  const Route({required this.name, required this.route, required this.builder});
}
