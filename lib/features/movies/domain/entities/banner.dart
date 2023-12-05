import 'package:equatable/equatable.dart';

class BannerEntity extends Equatable {
  final String? imageUrl;
  final String? name;

  const BannerEntity({
    this.imageUrl,
    this.name,
  });

  @override
  List<Object?> get props => [
        imageUrl,
        name,
      ];
}
