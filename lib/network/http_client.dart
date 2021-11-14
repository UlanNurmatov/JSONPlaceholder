import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_app/models/album.dart';
import 'package:test_app/models/comment.dart';
import 'package:test_app/models/photo.dart';
import 'package:test_app/models/post.dart';
import 'package:test_app/models/user.dart';
import 'package:test_app/network/api.dart';
import 'package:hive/hive.dart';

class HttpClient {
  static final HttpClient _singleton = HttpClient();
  static HttpClient get instance => _singleton;

  Future<dynamic> getUsers(String url) async {
    if (Hive.box('requests').containsKey(url)) {
      print('Contains data $url');
      String data = Hive.box('requests').get(url);
      final decodedJson = json.decode(data);
      final users = List<User>.from(decodedJson.map((x) => User.fromJson(x)));
      return users;
    } else {
      try {
        final response = await http.get(url);
        print(url);
        if (response.statusCode != 200) {
          throw Exception();
        } else {
          final decodedJson = json.decode(response.body);
          final users =
              List<User>.from(decodedJson.map((x) => User.fromJson(x)));
          Hive.box('requests').put(url, response.body);
          return users;
        }
      } catch (error) {
        print(error);
      }
    }
  }

  Future<dynamic> getPosts(int id) async {
    String url = Api.baseApi + 'users/$id/' + 'posts';
    if (Hive.box('requests').containsKey(url)) {
      print('Contains data $url');
      String data = Hive.box('requests').get(url);
      final decodedJson = json.decode(data);
      final posts = List<Post>.from(decodedJson.map((x) => Post.fromJson(x)));
      return posts;
    } else {
      try {
        final response = await http.get(url);
        print(url);
        if (response.statusCode != 200) {
          throw Exception();
        } else {
          final decodedJson = json.decode(response.body);
          final posts =
              List<Post>.from(decodedJson.map((x) => Post.fromJson(x)));
          Hive.box('requests').put(url, response.body);
          return posts;
        }
      } catch (error) {
        print(error);
      }
    }
  }

  Future<dynamic> getAlbums(int id) async {
    String url = Api.baseApi + 'users/$id/' + 'albums';
    if (Hive.box('requests').containsKey(url)) {
      print('Contains data $url');
      String data = Hive.box('requests').get(url);
      final decodedJson = json.decode(data);
      final albums =
          List<Album>.from(decodedJson.map((x) => Album.fromJson(x)));
      return albums;
    } else {
      try {
        final response = await http.get(url);
        print(url);
        if (response.statusCode != 200) {
          throw Exception();
        } else {
          final decodedJson = json.decode(response.body);
          final albums =
              List<Album>.from(decodedJson.map((x) => Album.fromJson(x)));
          Hive.box('requests').put(url, response.body);
          return albums;
        }
      } catch (error) {
        print(error);
      }
    }
  }

  Future<dynamic> getPhotos(int id) async {
    String url = Api.baseApi + 'albums/$id/' + 'photos';
    if (Hive.box('requests').containsKey(url)) {
      print('Contains data $url');
      String data = Hive.box('requests').get(url);
      final decodedJson = json.decode(data);
      final photos =
          List<Photo>.from(decodedJson.map((x) => Photo.fromJson(x)));
      return photos;
    } else {
      try {
        final response = await http.get(url);
        print(url);
        if (response.statusCode != 200) {
          throw Exception();
        } else {
          final decodedJson = json.decode(response.body);
          final photos =
              List<Photo>.from(decodedJson.map((x) => Photo.fromJson(x)));
          Hive.box('requests').put(url, response.body);
          return photos;
        }
      } catch (error) {
        print(error);
      }
    }
  }

  Future<dynamic> getComments(int id) async {
    String url = Api.baseApi + 'posts/$id/' + 'comments';
    if (Hive.box('requests').containsKey(url)) {
      print('Contains data $url');
      String data = Hive.box('requests').get(url);
      final decodedJson = json.decode(data);
      final comments =
          List<Comment>.from(decodedJson.map((x) => Comment.fromJson(x)));
      return comments;
    } else {
      try {
        final response = await http.get(url);
        print(url);
        if (response.statusCode != 200) {
          throw Exception();
        } else {
          final decodedJson = json.decode(response.body);
          final comments =
              List<Comment>.from(decodedJson.map((x) => Comment.fromJson(x)));
          Hive.box('requests').put(url, response.body);
          return comments;
        }
      } catch (error) {
        print(error);
      }
    }
  }
}
