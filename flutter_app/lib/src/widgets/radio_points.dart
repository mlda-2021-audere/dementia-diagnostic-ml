import 'package:flutter/material.dart';
import 'package:flutter_app/src/global_store.dart';
import 'package:provider/provider.dart';

class RadioPoints extends StatefulWidget {
  final String nextRouteName;
  final int maxPoints;

  const RadioPoints(
      {Key? key, required this.maxPoints, required this.nextRouteName})
      : super(key: key);

  @override
  _RadioPointsState createState() => _RadioPointsState();
}

class _RadioPointsState extends State<RadioPoints> {
  int _option = 0;

  @override
  Widget build(BuildContext context) {
    var optionsArray1 = Iterable<int>.generate(
        widget.maxPoints + 1 > 3 ? 3 : widget.maxPoints + 1);
    var optionsArray2 = Iterable<int>.generate(
            widget.maxPoints + 1 > 6 ? 3 : widget.maxPoints + 1 - 3)
        .map((option) => option + 3);
    var optionsArray3 = Iterable<int>.generate(
            widget.maxPoints + 1 > 9 ? 3 : widget.maxPoints + 1 - 6)
        .map((option) => option + 6);
    var optionsArray4 = Iterable<int>.generate(
        widget.maxPoints + 1 > 12 ? 3 : widget.maxPoints + 1 - 9)
        .map((option) => option + 9);
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            ...optionsArray1.map((option) => Expanded(
                flex: 1,
                child: ListTile(
                  title: Text('$option'),
                  leading: Radio<int>(
                    value: option,
                    groupValue: _option,
                    onChanged: (int? value) {
                      setState(() {
                        _option = value!;
                      });
                    },
                  ),
                )))
          ],
        ),
        Row(
          children: <Widget>[
            ...optionsArray2.map((option) => Expanded(
                flex: 1,
                child: ListTile(
                  title: Text('$option'),
                  leading: Radio<int>(
                    value: option,
                    groupValue: _option,
                    onChanged: (int? value) {
                      setState(() {
                        _option = value!;
                      });
                    },
                  ),
                )))
          ],
        ),
        Row(
          children: <Widget>[
            ...optionsArray3.map((option) => Expanded(
                flex: 1,
                child: ListTile(
                  title: Text('$option'),
                  leading: Radio<int>(
                    value: option,
                    groupValue: _option,
                    onChanged: (int? value) {
                      setState(() {
                        _option = value!;
                      });
                    },
                  ),
                )))
          ],
        ),
        Row(
          children: <Widget>[
            ...optionsArray4.map((option) => Expanded(
                flex: 1,
                child: ListTile(
                  title: Text('$option'),
                  leading: Radio<int>(
                    value: option,
                    groupValue: _option,
                    onChanged: (int? value) {
                      setState(() {
                        _option = value!;
                      });
                    },
                  ),
                )))
          ],
        ),
        ElevatedButton(
          onPressed: () {
            WidgetsBinding.instance!.addPostFrameCallback((_) {
              Provider.of<GlobalState>(context, listen: false)
                  .addToScore(_option);
              Navigator.pushNamed(context, widget.nextRouteName);
            });
          },
          child: const Text('Next'),
        )
      ],
    );
  }
}


