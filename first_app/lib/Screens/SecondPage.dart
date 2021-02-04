import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:first_app/Classes/Weather.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  Future<Weather> futureWeather;

  @override
  void initState() {
    super.initState();
    futureWeather = fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        decoration: BoxDecoration(
          color: Color.lerp(Color.fromRGBO(19, 24, 98, 0.9),
              Color.fromRGBO(135, 207, 235, 0.9), 0.1),
        ),
        child: Stack(children: <Widget>[
          Center(
            child: FutureBuilder<Weather>(
              future: futureWeather,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data.main.toString() + "°C");
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                // By default, show a loading spinner.
                return CircularProgressIndicator();
              },
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Image(
                image: AssetImage('assets/hills.png'),
              )),
          Align(
              alignment: Alignment.centerLeft,
              child: Image(
                image: AssetImage('assets/sun.png'),
              )),
          Align(
            alignment: Alignment.topCenter,
            //child: Text(fetchTime()),
            // child: FutureBuilder<Weather>(
            //   future: futureWeather,
            //   builder: (context, snapshot) {
            //     if (snapshot.hasData) {
            //       return Text(snapshot.data.clouds.toString());
            //     } else if (snapshot.hasError) {
            //       return Text("${snapshot.error}");
            //     }

            //     // By default, show a loading spinner.
            //     return Text('');
            //   },
            // ),
            // child: Text(fetchTime()),
            child: FutureBuilder<Weather>(
              future: futureWeather,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                      fetchTime(snapshot.data.sunrise, snapshot.data.sunset));
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                // By default, show a loading spinner.
                return Text('');
              },
            ),
          ),
        ]),
      ),
    ));
  }
}

Future<Weather> fetchWeather() async {
  final response = await http.get(
      'http://api.openweathermap.org/data/2.5/weather?q=Middlesbrough&appid=c5beab163be88deae6e93c286487398d');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    return Weather.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

String fetchTime(int sunrise, int sunset) {
  double midday = ((sunrise + sunset) / 2) * 1000;
  int now = DateTime.now().millisecondsSinceEpoch;

  double percent = (now - sunrise * 1000) / (midday - sunrise * 1000);
  if (percent > 1) {
    percent = 2 - percent;
  }
  return percent.toString();
}
