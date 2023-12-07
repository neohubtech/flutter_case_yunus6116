import 'package:flutter_case_yunus6116/core/resources/data_state.dart';
import 'package:flutter_case_yunus6116/core/usecase/usecase.dart';
import 'package:flutter_case_yunus6116/features/movies/domain/entities/movie_response.dart';
import 'package:flutter_case_yunus6116/features/movies/domain/repository/movie_repository.dart';

/// GetAllMoviesUseCase is the use case that is responsible for getting all movies.
class GetAllMoviesUseCase implements UseCase<DataState<MovieResponseEntity>, void> {
  final MovieRepository _movieRepository;

  GetAllMoviesUseCase(this._movieRepository);
  @override
  Future<DataState<MovieResponseEntity>> call({void params}) {
    return _movieRepository.getAllMovies();
  }
}
