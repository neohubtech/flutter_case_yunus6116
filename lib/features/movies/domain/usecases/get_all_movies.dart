import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/movie_response.dart';
import '../repository/movie_repository.dart';

/// GetAllMoviesUseCase is the use case that is responsible for getting all movies.
class GetAllMoviesUseCase implements UseCase<DataState<MovieResponseEntity>, void> {
  final MovieRepository _movieRepository;

  GetAllMoviesUseCase(this._movieRepository);
  @override
  Future<DataState<MovieResponseEntity>> call({void params}) {
    return _movieRepository.getAllMovies();
  }
}
