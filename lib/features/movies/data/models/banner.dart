import 'package:flutter_case_yunus6116/core/constants/constants.dart';
import 'package:flutter_case_yunus6116/features/movies/domain/entities/banner.dart';

/// Banner Model for Banner List
class BannerModel extends BannerEntity {
  const BannerModel({
    String? imageUrl,
    String? name,
  }) : super(
          imageUrl: imageUrl,
          name: name,
        );

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      imageUrl: json['imageUrl'] != null && json["imageUrl"] != "" ? json['imageUrl'] : kDefaultImage,
      name: json['name'],
    );
  }
}
