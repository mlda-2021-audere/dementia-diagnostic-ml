import 'package:flutter/material.dart';
import 'package:flutter_app/src/global_store.dart';
import 'package:flutter_app/src/years_edu_input.dart';
import 'package:provider/provider.dart';

class GenderInput extends StatefulWidget {
  const GenderInput({Key? key}) : super(key: key);

  static const String routeName = "/gender_input";

  @override
  _GenderInputState createState() => _GenderInputState();
}

enum Genders { male, female }

class _GenderInputState extends State<GenderInput> {
  @override
  Widget build(BuildContext context) {
    Genders _gender =
        Provider.of<GlobalState>(context, listen: true).getGender();
    return Scaffold(
      appBar: AppBar(title: const Text('Gender Input')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Please select your gender'),
            Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
                child: Column(children: <Widget>[
                  ListTile(
                    title: const Text('Male'),
                    leading: Radio<Genders>(
                      value: Genders.male,
                      groupValue: _gender,
                      onChanged: (Genders? value) {
                        setState(() {
                          Provider.of<GlobalState>(context, listen: false)
                              .setGender(Genders.male);
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Female'),
                    leading: Radio<Genders>(
                      value: Genders.female,
                      groupValue: _gender,
                      onChanged: (Genders? value) {
                        setState(() {
                          Provider.of<GlobalState>(context, listen: false)
                              .setGender(Genders.female);
                        });
                      },
                    ),
                  )
                ])),
            ElevatedButton(
              onPressed: () {
                WidgetsBinding.instance!.addPostFrameCallback((_) {
                  Provider.of<GlobalState>(context, listen: false)
                      .setGender(_gender);
                  Navigator.pushNamed(context, YearsEduInput.routeName);
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
