import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AlbumsPreviewShimmer extends StatelessWidget {
  const AlbumsPreviewShimmer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[100],
      enabled: true,
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.all(5.0),
        width: double.infinity,
        height: 160.0,
      ),
    );
  }
}
