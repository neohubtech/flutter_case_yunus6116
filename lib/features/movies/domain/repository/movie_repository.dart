import 'package:flutter_case_yunus6116/core/resources/data_state.dart';
import 'package:flutter_case_yunus6116/features/movies/domain/entities/movie.dart';
import 'package:flutter_case_yunus6116/features/movies/domain/entities/movie_response.dart';

abstract class MovieRepository {
  // API Methods
  Future<DataState<List<MovieResponseEntity>>> getAllMovies();

  // Database Methods
  Future<List<MovieEntity>> getSavedMovies();

  Future<void> saveMovie(MovieEntity movie);

  Future<void> removeMovie(MovieEntity movie);
}
