import 'package:flutter/material.dart';
import 'package:test_app/models/user.dart';
import 'package:test_app/network/api.dart';
import 'package:test_app/network/http_client.dart';

class UsersProvider with ChangeNotifier {
  List<User> _users;
  List<User> get users => _users;
  FetchStatus _status;
  FetchStatus get status => _status;

  UsersProvider() {
    fetchUsers();
  }

  fetchUsers() async {
    _status = FetchStatus.Loading;
    notifyListeners();
    try {
      _users = await HttpClient.instance.getUsers(Api.users);
      _status = FetchStatus.Fetched;
      notifyListeners();
    } catch (error) {
      _status = FetchStatus.Error;
    }
  }
}

enum FetchStatus { Loading, Fetched, Error }
