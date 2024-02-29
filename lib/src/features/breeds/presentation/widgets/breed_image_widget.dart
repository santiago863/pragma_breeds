import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BreedImageWidget extends StatelessWidget {
  final String reference;
  final double? size;

  const BreedImageWidget({
    super.key,
    required this.reference,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: CachedNetworkImage(
        key: ValueKey(
          reference,
        ),
        cacheKey: reference,
        imageUrl: 'https://cdn2.thecatapi.com/images/$reference.jpg',
        errorWidget: (context, url, error) => const Icon(
          Icons.error,
        ),
        height: size,
        width: size,
        fit: size != null ? BoxFit.cover : null,
        filterQuality: FilterQuality.medium,
      ),
    );
  }
}
