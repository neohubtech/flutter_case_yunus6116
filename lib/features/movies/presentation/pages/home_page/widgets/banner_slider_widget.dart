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
      margin: const EdgeInsets.only(top: 12),
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
                color: Colors.blueGrey.shade500,
                width: 4,
              ),
              image: DecorationImage(
                image: NetworkImage(
                  bannerList[index].imageUrl!,
                ),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
