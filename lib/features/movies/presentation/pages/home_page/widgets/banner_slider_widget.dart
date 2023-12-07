import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_case_yunus6116/core/extensions/context_extensions.dart';

import 'package:flutter_case_yunus6116/features/movies/domain/entities/banner.dart';

class BannerSliderWidget extends StatelessWidget {
  const BannerSliderWidget({
    Key? key,
    required this.bannerList,
  }) : super(key: key);

  final List<BannerEntity> bannerList;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      height: context.height * .11,
      child: ListView.builder(
        itemCount: bannerList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            height: context.height * .1,
            width: context.height * .1,
            margin: EdgeInsets.only(right: 28.0, left: index == 0 ? 32.0 : 0.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              border: Border.all(
                color: Colors.black.withOpacity(0.6),
                width: 4,
              ),
            ),
            child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: bannerList[index].imageUrl!,
                imageBuilder: (context, imageProvider) => ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image(image: imageProvider, fit: BoxFit.cover),
                    ),
                errorWidget: (context, url, error) => Padding(
                      padding: const EdgeInsetsDirectional.only(end: 14),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 3,
                          height: double.maxFinite,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.08),
                          ),
                          child: const Icon(Icons.error),
                        ),
                      ),
                    )),
          );
        },
      ),
    );
  }
}
