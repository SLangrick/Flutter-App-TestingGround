import 'package:flutter/material.dart';
import 'package:first_app/Widgets/PostList.dart';
import 'package:first_app/Widgets/TextWidget.dart';
import 'package:first_app/Classes/post.dart';
import 'package:first_app/Widgets/textInput.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String text = "";
  List<Post> posts = [];

  void changeText(String text) {
    this.setState(() {
      this.text = text;
    });
  }

  void newPosts(String text) {
    this.setState(() {
      posts.add(Post("Test", text));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        Expanded(child: PostList(this.posts)),
        TextWidget(),
        Text(this.text),
        TextInputWidget(this.newPosts),
      ]),
    );
  }
}
