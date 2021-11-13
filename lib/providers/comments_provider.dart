import 'package:flutter/material.dart';
import 'package:test_app/models/comment.dart';
import 'package:test_app/network/http_client.dart';
import 'package:test_app/providers/users_provider.dart';

class CommentsProvider with ChangeNotifier {
  List<Comment> _comments;
  List<Comment> get comments => _comments;
  FetchStatus _status;
  FetchStatus get status => _status;

  CommentsProvider(int postId) {
    fetchComments(postId);
  }

  fetchComments(int postId) async {
    _status = FetchStatus.Loading;
    notifyListeners();
    try {
      _comments = await HttpClient.instance.getComments(postId);
      _status = FetchStatus.Fetched;
      notifyListeners();
    } catch (error) {
      print(error);
      _status = FetchStatus.Error;
      notifyListeners();
    }
  }
}
