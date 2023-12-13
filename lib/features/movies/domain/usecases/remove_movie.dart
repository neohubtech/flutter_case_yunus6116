import '../../../../core/usecase/usecase.dart';
import '../entities/movie.dart';
import '../repository/movie_repository.dart';

/// RemoveMovieUseCase is the use case that is responsible for removing a movie.
class RemoveMovieUseCase implements UseCase<void, MovieEntity> {
  final MovieRepository _movieRepository;

  RemoveMovieUseCase(this._movieRepository);
  @override
  Future<void> call({MovieEntity? params}) {
    return _movieRepository.removeMovie(params!);
  }
}
