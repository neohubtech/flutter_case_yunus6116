import 'package:floor/floor.dart';
import 'package:flutter_case_yunus6116/features/movies/data/models/movie.dart';

/// Movie Dao (Data Access Object)
@dao
abstract class MovieDao {
  @Insert()
  Future<void> insertMovie(MovieModel movie);

  @delete
  Future<void> deleteMovie(MovieModel movie);

  @Query('SELECT * FROM movies')
  Future<List<MovieModel>> getMovies();
}
