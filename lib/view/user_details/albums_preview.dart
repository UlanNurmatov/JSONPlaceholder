import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/providers/albums_preview_provider.dart';
import 'package:test_app/providers/users_provider.dart';
import 'package:test_app/view/image_widget.dart';
import 'package:test_app/view/user_albums.dart';
import 'albums_preview_shimmer.dart';

class AlbumsPreview extends StatelessWidget {
  final int userId;
  AlbumsPreview(this.userId);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AlbumsPreviewProvider(userId),
        child: AlbumsPreviewCard());
  }
}

class AlbumsPreviewCard extends StatelessWidget {
  const AlbumsPreviewCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final albumsProvider =
        Provider.of<AlbumsPreviewProvider>(context, listen: false);
    return Card(
        child: Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Albums',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
            ),
            TextButton(
                onPressed: () {
                  final userAlbums = UserAlbums(albumsProvider.albums);
                  if (albumsProvider.status == FetchStatus.Fetched) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => userAlbums));
                  }
                },
                child: Text('See all', style: TextStyle(fontSize: 16.0)))
          ],
        ),
      ),
      Consumer<AlbumsPreviewProvider>(builder: (context, albumsPreview, child) {
        if (albumsPreview.status == FetchStatus.Loading) {
          return AlbumsPreviewShimmer();
        } else if (albumsPreview.status == FetchStatus.Fetched) {
          return SizedBox(
            height: 160,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(3, (index) {
                String url = albumsPreview
                    .photosOfPreviewAlbums[index].first.thumbnailUrl;
                return Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    height: 150,
                    width: 150,
                    child: NetworkImageWidget(url));
              }),
            ),
          );
        } else if (albumsPreview.status == FetchStatus.Error) {
          return Text('ERROR');
        }
      })
    ]));
  }
}
