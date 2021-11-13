import 'package:flutter/material.dart';
import 'package:test_app/models/post.dart';
import 'package:test_app/view/comments/comments.dart';

class PostPreview extends StatelessWidget {
  final Post post;
  PostPreview(this.post);
  @override
  Widget build(BuildContext context) {
    String subtitle = post.body.substring(0, post.body.indexOf('\n'));
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: ListTile(
        title: Text(
          post.title,
          style: TextStyle(fontSize: 18),
        ),
        subtitle: Text('$subtitle...'),
        trailing: Icon(Icons.keyboard_arrow_right_rounded),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PostDetails(post)));
        },
      ),
    );
  }
}
