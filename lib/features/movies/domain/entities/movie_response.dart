import 'package:equatable/equatable.dart';

import 'banner.dart';
import 'movie.dart';

class MovieResponseEntity extends Equatable {
  final List<BannerEntity>? bannerList;
  final List<MovieEntity>? movieList;

  const MovieResponseEntity({
    this.bannerList,
    this.movieList,
  });

  @override
  List<Object?> get props => [
        bannerList,
        movieList,
      ];
}
