import 'package:flutter/material.dart';
import 'package:test_app/models/album.dart';

class UserAlbums extends StatelessWidget {
  final List<Album> albums;
  UserAlbums(this.albums);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Posts')),
        body: ListView.builder(
          itemBuilder: (context, index) {
            String title = albums[index].title;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: ListTile(
                  title: Text(
                    title,
                    style: TextStyle(fontSize: 18),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right_rounded),
                  onTap: () {}),
            );
          },
          itemCount: albums.length,
        ));
  }
}
