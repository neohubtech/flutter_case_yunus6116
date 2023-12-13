import '../../../../core/resources/data_state.dart';
import '../entities/movie.dart';
import '../entities/movie_response.dart';

abstract class MovieRepository {
  // API Methods
  Future<DataState<MovieResponseEntity>> getAllMovies();

  // Database Methods
  Future<List<MovieEntity>> getSavedMovies();

  Future<void> saveMovie(MovieEntity movie);

  Future<void> removeMovie(MovieEntity movie);
}
