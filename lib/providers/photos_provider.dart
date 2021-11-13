import 'package:flutter/material.dart';
import 'package:test_app/models/photo.dart';
import 'package:test_app/network/http_client.dart';
import 'package:test_app/providers/users_provider.dart';

class PhotosProvider with ChangeNotifier {
  List<Photo> _photos;
  List<Photo> get photos => _photos;
  FetchStatus _status;
  FetchStatus get status => _status;

  PhotosProvider(int id) {
    fetchPhotos(id);
  }

  fetchPhotos(int id) async {
    _status = FetchStatus.Loading;
    notifyListeners();
    try {
      _photos = await HttpClient.instance.getPhotos(id);
      _status = FetchStatus.Fetched;
      notifyListeners();
    } catch (error) {
      print(error);
      _status = FetchStatus.Error;
      notifyListeners();
    }
  }
}
