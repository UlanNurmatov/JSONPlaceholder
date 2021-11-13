import 'package:flutter/material.dart';
import 'package:test_app/models/album.dart';
import 'package:test_app/models/photo.dart';
import 'package:test_app/network/http_client.dart';
import 'package:test_app/providers/users_provider.dart';

class AlbumsPreviewProvider with ChangeNotifier {
  List<Album> _albums;
  List<Album> get albums => _albums;
  FetchStatus _status;
  FetchStatus get status => _status;
  List<List<Photo>> _photosOfPreviewAlbums = [];
  List<List<Photo>> get photosOfPreviewAlbums => _photosOfPreviewAlbums;

  AlbumsPreviewProvider(int userId) {
    fetchAlbums(userId);
  }

  fetchAlbums(int userId) async {
    _status = FetchStatus.Loading;
    notifyListeners();
    try {
      _albums = await HttpClient.instance.getAlbums(userId);
      List<int> ids = List.generate(3, (index) => _albums[index].id);
      await Future.forEach(ids, (element) async {
        List<Photo> photos = await HttpClient.instance.getPhotos(element);
        _photosOfPreviewAlbums.add(photos);
      });
      _status = FetchStatus.Fetched;
      notifyListeners();
    } catch (error) {
      print(error);
      _status = FetchStatus.Error;
      notifyListeners();
    }
  }
}
