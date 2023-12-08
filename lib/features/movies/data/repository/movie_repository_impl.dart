import 'dart:io';

import 'package:dio/dio.dart';
import '../../../../core/resources/data_state.dart';
import '../data_sources/local/app_database.dart';
import '../data_sources/remote/movies_api_service.dart';
import '../models/movie.dart';
import '../models/movie_response.dart';
import '../../domain/entities/movie.dart';
import '../../domain/repository/movie_repository.dart';

/// MovieRepositoryImpl is the implementation of the [MovieRepository] interface.
class MovieRepositoryImpl implements MovieRepository {
  final MovieApiService _movieApiService;
  final AppDatabase _appDatabase;
  MovieRepositoryImpl(this._movieApiService, this._appDatabase);
  @override
  Future<DataState<MovieResponseModel>> getAllMovies() async {
    try {
      final httpResponse = await _movieApiService.getAllMovies();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            requestOptions: httpResponse.response.requestOptions,
            response: httpResponse.response,
            error: httpResponse.response.statusMessage,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<List<MovieEntity>> getSavedMovies() async {
    return _appDatabase.movieDao.getMovies();
  }

  @override
  Future<void> removeMovie(MovieEntity movie) {
    return _appDatabase.movieDao.deleteMovie(MovieModel.fromEntity(movie));
  }

  @override
  Future<void> saveMovie(MovieEntity movie) {
    return _appDatabase.movieDao.insertMovie(MovieModel.fromEntity(movie));
  }
}
