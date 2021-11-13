import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_app/models/album.dart';
import 'package:test_app/models/comment.dart';
import 'package:test_app/models/photo.dart';
import 'package:test_app/models/post.dart';
import 'package:test_app/models/user.dart';
import 'package:test_app/network/api.dart';

class HttpClient {
  static final HttpClient _singleton = HttpClient();
  static HttpClient get instance => _singleton;

  Future<dynamic> getUsers(String url) async {
    try {
      final response = await http.get(url);
      if (response.statusCode != 200) {
        throw Exception();
      } else {
        final decodedJson = json.decode(response.body);
        final users = List<User>.from(decodedJson.map((x) => User.fromJson(x)));
        return users;
      }
    } catch (error) {
      print(error);
    }
  }

  Future<dynamic> getPosts(int id) async {
    try {
      String url = Api.baseApi + 'users/$id/' + 'posts';
      final response = await http.get(url);
      print(url);
      if (response.statusCode != 200) {
        throw Exception();
      } else {
        final decodedJson = json.decode(response.body);
        final users = List<Post>.from(decodedJson.map((x) => Post.fromJson(x)));
        return users;
      }
    } catch (error) {
      print(error);
    }
  }

  Future<dynamic> getAlbums(int id) async {
    try {
      String url = Api.baseApi + 'users/$id/' + 'albums';
      final response = await http.get(url);
      print(url);
      if (response.statusCode != 200) {
        throw Exception();
      } else {
        final decodedJson = json.decode(response.body);
        final users =
            List<Album>.from(decodedJson.map((x) => Album.fromJson(x)));
        return users;
      }
    } catch (error) {
      print(error);
    }
  }

  Future<dynamic> getPhotos(int id) async {
    try {
      String url = Api.baseApi + 'albums/$id/' + 'photos';
      final response = await http.get(url);
      print(url);
      if (response.statusCode != 200) {
        throw Exception();
      } else {
        final decodedJson = json.decode(response.body);
        final photos =
            List<Photo>.from(decodedJson.map((x) => Photo.fromJson(x)));
        return photos;
      }
    } catch (error) {
      print(error);
    }
  }

  Future<dynamic> getComments(int id) async {
    try {
      String url = Api.baseApi + 'posts/$id/' + 'comments';
      final response = await http.get(url);
      if (response.statusCode != 200) {
        throw Exception();
      } else {
        final decodedJson = json.decode(response.body);
        final users =
            List<Comment>.from(decodedJson.map((x) => Comment.fromJson(x)));
        return users;
      }
    } catch (error) {
      print(error);
    }
  }
}
