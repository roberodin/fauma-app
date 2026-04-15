import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../data/image_assets.dart';

/// Drop-in image widget that tries local asset first, falls back to network.
class FaumaImage extends StatelessWidget {
  const FaumaImage({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.placeholder,
    this.errorWidget,
  });

  final String imageUrl;
  final BoxFit fit;
  final double? width;
  final double? height;
  final Widget? placeholder;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    final localPath = ImageAssets.resolve(imageUrl);

    if (localPath != null) {
      return Image.asset(
        localPath,
        fit: fit,
        width: width,
        height: height,
        errorBuilder: (_, __, ___) =>
            errorWidget ??
            Container(
              color: Theme.of(context).colorScheme.surfaceContainerLow,
              child: const Icon(Icons.image_not_supported_outlined, size: 32),
            ),
      );
    }

    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      width: width,
      height: height,
      placeholder: (_, __) =>
          placeholder ??
          Container(color: Theme.of(context).colorScheme.surfaceContainerLow),
      errorWidget: (_, __, ___) =>
          errorWidget ??
          Container(
            color: Theme.of(context).colorScheme.surfaceContainerLow,
            child: const Icon(Icons.image_not_supported_outlined, size: 32),
          ),
    );
  }
}
