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

var genders = <String>['male', 'female', 'other', 'prefer not to say'];

String dropdownValue = genders[0];

class _GenderInputState extends State<GenderInput> {
  @override
  void initState() {
    super.initState();
    dropdownValue = genders[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gender Input')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Please input your gender here'),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton<String>(
                  value: dropdownValue,
                  hint: const Text('Gender'),
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: genders.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                )),
            ElevatedButton(
              onPressed: () {
                WidgetsBinding.instance!.addPostFrameCallback((_) {
                  Provider.of<GlobalState>(context, listen: false)
                      .setGender(dropdownValue);
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
