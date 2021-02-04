import 'package:flutter/material.dart';

import 'package:first_app/Screens/ThirdPage.dart';
import 'package:first_app/Screens/SecondPage.dart';
import 'package:first_app/Screens/FirstPage.dart';
import 'package:first_app/Screens/FourthPage.dart';
import 'package:first_app/Screens/FifthPage.dart';
import 'package:first_app/Screens/SixthPage.dart';
import 'package:first_app/Screens/SeventhPage.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final List<Widget> _children = [
    SeventhPage(),
    SecondPage(),
    SixthPage(),
    FifthPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Icon(Icons.ac_unit_rounded), title: Text('Hello World')),
      body: _children[_selectedIndex],
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
            icon: const Icon(Icons.child_care),
            label: 'Title',
          ),
          new BottomNavigationBarItem(
            icon: const Icon(Icons.cloud_circle),
            label: 'Title',
          ),
          new BottomNavigationBarItem(
            icon: const Icon(Icons.collections),
            label: 'Title',
          ),
          new BottomNavigationBarItem(
            icon: const Icon(Icons.account_tree_sharp),
            label: 'Title',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
