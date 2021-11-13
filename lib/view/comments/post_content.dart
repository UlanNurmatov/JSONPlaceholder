import 'package:flutter/material.dart';
import 'package:test_app/models/post.dart';

class PostContent extends StatelessWidget {
  const PostContent({
    Key key,
    @required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Column(children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              post.title,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(height: 20.0),
          Align(
              alignment: Alignment.centerLeft,
              child: Text(post.body, style: TextStyle(fontSize: 18)))
        ]));
  }
}
