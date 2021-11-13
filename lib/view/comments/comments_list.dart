import 'package:flutter/material.dart';
import 'package:test_app/models/comment.dart';

import 'bottom_sheet.dart';

class CommentsList extends StatelessWidget {
  final List<Comment> comments;
  final int postId;
  CommentsList(this.comments, this.postId);
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Card(
                elevation: 2.0,
                margin: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                          child:
                              CircleAvatar(child: Icon(Icons.person_rounded))),
                    ),
                    Expanded(
                      flex: 8,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0.0, 5.0, 10.0, 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  0.0, 5.0, 10.0, 10.0),
                              child: Text(comments[index].name,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  0.0, 5.0, 10.0, 10.0),
                              child: Text(comments[index].email,
                                  style: TextStyle(fontSize: 18)),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  0.0, 5.0, 10.0, 10.0),
                              child: Text(comments[index].body,
                                  style: TextStyle(fontSize: 16)),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            }, childCount: comments.length),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
            sliver: SliverToBoxAdapter(
              child: ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Add a comment',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                onPressed: () {
                  showBottomSheet(
                      context: context,
                      builder: (context) {
                        return AddCommentBottomSheet(postId);
                      });
                },
              ),
            ),
          )
        ]);
  }
}
