import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import 'loading_item.dart';

class ImageItem extends StatelessWidget {
  const ImageItem(
    this.img, {
    super.key,
    this.width,
    this.height,
    this.fit,
    this.color,
  });
  final String img;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return img.contains("assets/images")
        ? Image.asset(img, height: height, width: width, fit: fit, color: color)
        : CachedNetworkImage(
            imageUrl: img,
            height: height,
            width: width,
            fit: fit,
            color: color,
            placeholder: (context, url) => const LoadingItem(),
            errorWidget: (context, url, error) =>
                const Icon(CupertinoIcons.photo),
          );
  }
}
