import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:first_app/Classes/Album.dart';

class FourthPage extends StatefulWidget {
  @override
  _FourthPageState createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  int key = 0;
  List<Widget> body = [
    Text(
      'Hi',
      key: UniqueKey(),
    ),
    Text(
      'Bye',
      key: UniqueKey(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(seconds: 1),
          child: body[key],
        ),
        RaisedButton(
          onPressed: () {
            setState(() {
              switcher();
            });
          },
          child: Text(
            "Raised Button",
          ),
        )
      ]),
    ));
  }

  switcher() {
    if (key == 0) {
      key = 1;
    } else {
      key = 0;
    }
  }
}
