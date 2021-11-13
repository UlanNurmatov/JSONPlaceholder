import 'package:flutter/material.dart';
import 'package:test_app/models/comment.dart';
import 'package:test_app/models/post.dart';
import 'package:test_app/network/api.dart';
import 'package:test_app/providers/comments_provider.dart';
import 'package:test_app/providers/users_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:test_app/view/comments/post_content.dart';

import 'comments_list.dart';

class PostDetails extends StatelessWidget {
  PostDetails(this.post);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CommentsProvider(post.id),
        child: Scaffold(
            appBar: AppBar(
              title: Text('Comments'),
            ),
            body: SingleChildScrollView(
              child: Column(children: [
                PostContent(post: post),
                Consumer<CommentsProvider>(
                    builder: (context, commentsProvider, child) {
                  if (commentsProvider.status == FetchStatus.Loading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (commentsProvider.status == FetchStatus.Fetched) {
                    return CommentsList(commentsProvider.comments, post.id);
                  } else if (commentsProvider.status == FetchStatus.Error) {
                    Center(child: Text('Error'));
                  } else {
                    return Center(child: Text('Something went wrong'));
                  }
                  return Center(child: Text('Something went wrong'));
                })
              ]),
            )));
  }
}
