import 'package:flutter/material.dart';

class EasyAssetIMGWidget extends StatelessWidget {
  const EasyAssetIMGWidget({Key? key, required this.imgUrl}) : super(key: key);

  final String imgUrl;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imgUrl,
      height: 200,
      width: 200,
      fit: BoxFit.cover,
    );
  }
}
