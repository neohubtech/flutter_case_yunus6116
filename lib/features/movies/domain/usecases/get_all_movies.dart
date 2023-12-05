import 'package:flutter_case_yunus6116/core/resources/data_state.dart';
import 'package:flutter_case_yunus6116/core/usecase/usecase.dart';
import 'package:flutter_case_yunus6116/features/movies/domain/entities/movie_response.dart';
import 'package:flutter_case_yunus6116/features/movies/domain/repository/movie_repository.dart';

class GetAllMoviesUseCase implements UseCase<DataState<List<MovieResponseEntity>>, void> {
  final MovieRepository _movieRepository;

  GetAllMoviesUseCase(this._movieRepository);
  @override
  Future<DataState<List<MovieResponseEntity>>> call({void params}) {
    return _movieRepository.getAllMovies();
  }
}
