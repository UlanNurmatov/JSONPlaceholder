import 'package:flutter/material.dart';
import 'package:test_app/models/post.dart';
import 'package:test_app/view/comments/comments.dart';

class UserPosts extends StatelessWidget {
  final List<Post> posts;
  UserPosts(this.posts);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Posts')),
        body: ListView.builder(
          itemBuilder: (context, index) {
            String title = posts[index].title;
            String body = posts[index].body;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: ListTile(
                  title: Text(
                    title,
                    style: TextStyle(fontSize: 18),
                  ),
                  subtitle: Text('${body.substring(0, body.indexOf('\n'))}...'),
                  trailing: Icon(Icons.keyboard_arrow_right_rounded),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PostDetails(posts[index])));
                  }),
            );
          },
          itemCount: posts.length,
        ));
  }
}
