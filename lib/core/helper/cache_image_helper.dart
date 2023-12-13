import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// Helper class for caching images
class CacheImageHelper {
  /// Caches images
  static Future<void> cacheImages({
    required List<String> imageUrls,
    required BuildContext context,
  }) async {
    for (var imageUrl in imageUrls) {
      try {
        await precacheImage(
            CachedNetworkImageProvider(
              imageUrl,
              errorListener: (p0) {
                debugPrint("ERROR: $p0");
              },
            ),
            context);
      } on Exception catch (e) {
        debugPrint(e.toString());
      }
    }
  }
}
