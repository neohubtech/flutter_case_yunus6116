import '../../../../core/constants/constants.dart';
import '../../domain/entities/banner.dart';

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
