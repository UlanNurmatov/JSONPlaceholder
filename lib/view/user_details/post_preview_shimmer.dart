import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PostPreviewShimmer extends StatelessWidget {
  const PostPreviewShimmer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[100],
        enabled: true,
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 40),
          child: Column(
            children: [
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(5.0),
                width: double.infinity,
                height: 25.0,
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(5.0),
                width: double.infinity,
                height: 25.0,
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(5.0),
                width: double.infinity,
                height: 25.0,
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(5.0),
                width: double.infinity,
                height: 25.0,
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(5.0),
                width: double.infinity,
                height: 25.0,
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(5.0),
                width: double.infinity,
                height: 25.0,
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ));
  }
}
