import 'package:flutter_case_yunus6116/core/usecase/usecase.dart';
import 'package:flutter_case_yunus6116/features/movies/domain/entities/movie.dart';
import 'package:flutter_case_yunus6116/features/movies/domain/repository/movie_repository.dart';

/// RemoveMovieUseCase is the use case that is responsible for removing a movie.
class RemoveMovieUseCase implements UseCase<void, MovieEntity> {
  final MovieRepository _movieRepository;

  RemoveMovieUseCase(this._movieRepository);
  @override
  Future<void> call({MovieEntity? params}) {
    return _movieRepository.removeMovie(params!);
  }
}
