import '../../../../core/usecase/usecase.dart';
import '../entities/movie.dart';
import '../repository/movie_repository.dart';

/// GetSavedMoviesUseCase is the use case that is responsible for getting saved movies.
class GetSavedMoviesUseCase implements UseCase<List<MovieEntity>, void> {
  final MovieRepository _movieRepository;

  GetSavedMoviesUseCase(this._movieRepository);
  @override
  Future<List<MovieEntity>> call({void params}) {
    return _movieRepository.getSavedMovies();
  }
}
