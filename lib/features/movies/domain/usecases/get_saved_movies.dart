import 'package:flutter_case_yunus6116/core/usecase/usecase.dart';
import 'package:flutter_case_yunus6116/features/movies/domain/entities/movie.dart';
import 'package:flutter_case_yunus6116/features/movies/domain/repository/movie_repository.dart';

class GetSavedMoviesUseCase implements UseCase<List<MovieEntity>, void> {
  final MovieRepository _movieRepository;

  GetSavedMoviesUseCase(this._movieRepository);
  @override
  Future<List<MovieEntity>> call({void params}) {
    return _movieRepository.getSavedMovies();
  }
}
