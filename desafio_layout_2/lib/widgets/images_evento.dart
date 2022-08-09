import 'package:flutter/material.dart';

class ImagemEvento extends StatelessWidget {
  ImagemEvento({Key? key, required this.imageSize, required this.image})
      : super(key: key);
  double imageSize;
  final dynamic image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: imageSize,
      child: Hero(
        tag: image,
        child: ClipRRect(
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(32)),
          child: Image.network(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
