import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/providers/posts_provider.dart';
import 'package:test_app/providers/users_provider.dart';
import 'package:test_app/view/user_details/post_preview_shimmer.dart';
import 'package:test_app/view/user_details/post_preview.dart';
import 'package:test_app/view/user_posts.dart';

class PostsPreview extends StatelessWidget {
  final int userId;
  PostsPreview(this.userId);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => PostsProvider(userId), child: PostsPreviewCard());
  }
}

class PostsPreviewCard extends StatelessWidget {
  const PostsPreviewCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postsProvider = Provider.of<PostsProvider>(context, listen: false);
    return Card(
        elevation: 1.0,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Posts',
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
                ),
                TextButton(
                    onPressed: () {
                      final userPosts = UserPosts(postsProvider.posts);

                      if (postsProvider.status == FetchStatus.Fetched) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => userPosts));
                      }
                    },
                    child: Text('See all', style: TextStyle(fontSize: 16.0)))
              ],
            ),
          ),
          Consumer<PostsProvider>(builder: (context, postsProvider, child) {
            if (postsProvider.status == FetchStatus.Loading) {
              return PostPreviewShimmer();
            } else if (postsProvider.status == FetchStatus.Fetched) {
              return Padding(
                padding: const EdgeInsets.only(
                    right: 20.0, left: 20.0, bottom: 20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(3, (index) {
                      return PostPreview(
                        postsProvider.posts[index],
                      );
                    })),
              );
            } else if (postsProvider.status == FetchStatus.Error) {
              return Text('ERROR');
            }
          })
        ]));
  }
}
