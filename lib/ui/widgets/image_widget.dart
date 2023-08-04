import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ImageWidget extends StatelessWidget {
  final String path;
  final double size;

  const ImageWidget({super.key, required this.path, this.size = 100});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: path,
      imageBuilder: (context, imageProvider) => Container(
        width: size * 1.2,
        height: size,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            image: DecorationImage(image: imageProvider, fit: BoxFit.fill)),
      ),
      placeholder: (context, url) => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6), color: Colors.white),
        child: Lottie.asset(
          'assets/lotties/image_loader.json',
          width: size * 1.2,
          height: size,
          fit: BoxFit.fill,
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
