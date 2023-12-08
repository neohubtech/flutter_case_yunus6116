import '../../../../core/usecase/usecase.dart';
import '../entities/movie.dart';
import '../repository/movie_repository.dart';

/// SaveMovieUseCase is the use case that is responsible for saving a movie.
class SaveMovieUseCase implements UseCase<void, MovieEntity> {
  final MovieRepository _movieRepository;

  SaveMovieUseCase(this._movieRepository);
  @override
  Future<void> call({MovieEntity? params}) {
    return _movieRepository.saveMovie(params!);
  }
}
