import 'package:flutter/material.dart';
import 'package:test_app/models/post.dart';
import 'package:test_app/network/http_client.dart';
import 'package:test_app/providers/users_provider.dart';

class PostsProvider with ChangeNotifier {
  List<Post> _posts;
  List<Post> get posts => _posts;
  FetchStatus _status;
  FetchStatus get status => _status;
  PostsProvider(int userId) {
    fetchPosts(userId);
  }

  fetchPosts(int userId) async {
    _status = FetchStatus.Loading;
    notifyListeners();
    try {
      _posts = await HttpClient.instance.getPosts(userId);
      _status = FetchStatus.Fetched;
      notifyListeners();
    } catch (error) {
      print(error);
      _status = FetchStatus.Error;
      notifyListeners();
    }
  }
}
