import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sample/src/widgets/place_holder_widget.dart';

class ImageWidget extends StatelessWidget {
  final String imageUrl;

  const ImageWidget({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.fill,
      imageUrl: imageUrl,
      placeholder: (_, __) => const PlaceHolderWidget(),
      errorWidget: (_, __, ___) => const PlaceHolderWidget(),
    );
  }
}
