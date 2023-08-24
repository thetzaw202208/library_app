import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class EasyImageWidget extends StatelessWidget {
  const EasyImageWidget(
      {Key? key, required this.imgUrl, this.width, this.height})
      : super(key: key);

  final String imgUrl;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imgUrl,
      height: height ?? 240,
      width: width ?? 150,
      fit: BoxFit.cover,
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) =>
          const Center(child: Icon(Icons.error)),
    );
  }
}
