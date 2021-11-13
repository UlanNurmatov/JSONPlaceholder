import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NetworkImageWidget extends StatelessWidget {
  final String url;

  NetworkImageWidget(this.url);

  @override
  Widget build(BuildContext context) {
    return OctoImage(
      image: CachedNetworkImageProvider(url),
      placeholderBuilder: OctoPlaceholder.blurHash(
        'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
      ),
      errorBuilder: OctoError.circleAvatar(
          backgroundColor: Colors.black45,
          text: Text('No Image')), //icon(color: Colors.red),
      fit: BoxFit.contain,
    );
  }
}
