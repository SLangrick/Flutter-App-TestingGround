import 'package:flutter/material.dart';
import 'package:first_app/Classes/post.dart';

class PostList extends StatefulWidget {
  final List<Post> posts;

  PostList(this.posts);

  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  void like(Function callback) {
    this.setState(() {
      callback();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: this.widget.posts.length,
        itemBuilder: (context, index) {
          var post = this.widget.posts[index];
          return Card(
              child: Row(
            children: <Widget>[
              Expanded(
                  child: ListTile(
                      title: Text(post.body), subtitle: Text(post.author))),
              Row(
                children: <Widget>[
                  Container(
                    child: Text(post.likes.toString(),
                        style: TextStyle(fontSize: 20)),
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  ),
                  IconButton(
                      icon: Icon(Icons.thumb_up),
                      onPressed: () => like(post.likePost),
                      color: post.userLiked ? Colors.green : Colors.black)
                ],
              )
            ],
          ));
        });
  }
}
