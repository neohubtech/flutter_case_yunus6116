import 'package:flutter_case_yunus6116/core/usecase/usecase.dart';
import 'package:flutter_case_yunus6116/features/movies/domain/entities/movie.dart';
import 'package:flutter_case_yunus6116/features/movies/domain/repository/movie_repository.dart';

class SaveMovieUseCase implements UseCase<void, MovieEntity> {
  final MovieRepository _movieRepository;

  SaveMovieUseCase(this._movieRepository);
  @override
  Future<void> call({MovieEntity? params}) {
    return _movieRepository.saveMovie(params!);
  }
}
