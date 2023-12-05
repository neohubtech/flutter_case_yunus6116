import 'package:flutter_case_yunus6116/features/movies/domain/entities/movie_response.dart';

import 'banner.dart';
import 'movie.dart';

/// Movie Response Model
class MovieResponseModel extends MovieResponseEntity {
  const MovieResponseModel({
    List<BannerModel>? bannerList,
    List<MovieModel>? movieList,
  }) : super(
          bannerList: bannerList,
          movieList: movieList,
        );

  factory MovieResponseModel.fromJson(Map<String, dynamic> json) {
    List<BannerModel>? bannerList;
    List<MovieModel>? movieList;

    if (json['bannerList'] != null) {
      bannerList = <BannerModel>[];
      json['bannerList'].forEach((v) {
        bannerList!.add(BannerModel.fromJson(v));
      });
    }

    if (json['combinedList'] != null) {
      movieList = <MovieModel>[];
      json['combinedList'].forEach((v) {
        movieList!.add(MovieModel.fromJson(v));
      });
    }

    return MovieResponseModel(
      bannerList: bannerList,
      movieList: movieList,
    );
  }
}
