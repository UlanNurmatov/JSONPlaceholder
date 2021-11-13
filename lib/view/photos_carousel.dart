import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:test_app/providers/photos_provider.dart';
import 'package:test_app/providers/users_provider.dart';
import 'package:test_app/view/image_widget.dart';

class PhotosCarousel extends StatelessWidget {
  final int id;
  PhotosCarousel(this.id);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => PhotosProvider(id),
        child: Scaffold(
            appBar: AppBar(
              title: Text('Photos'),
            ),
            body: Consumer<PhotosProvider>(
                builder: (context, photosProvider, child) {
              if (photosProvider.status == FetchStatus.Loading) {
                return Container(
                    width: double.infinity,
                    height: 300,
                    child: Center(child: CircularProgressIndicator()));
              } else if (photosProvider.status == FetchStatus.Fetched) {
                return Container(
                  padding: EdgeInsets.only(top: 30.0),
                  child: CarouselSlider(
                    options: CarouselOptions(
                        height: 300.0, enableInfiniteScroll: false),
                    items: photosProvider.photos.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              child: NetworkImageWidget(i.url));
                        },
                      );
                    }).toList(),
                  ),
                );
              } else if (photosProvider.status == FetchStatus.Error) {
                Text('ERROR');
              }
            })));
  }
}
