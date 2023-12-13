import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import '../../../../domain/entities/movie_response.dart';

/// RemoteMoviesEvent is the event class for the RemoteMoviesBloc.
abstract class RemoteMoviesState extends Equatable {
  final MovieResponseEntity? allMovies;
  final DioException? error;

  const RemoteMoviesState({this.allMovies, this.error});

  @override
  List<Object?> get props => [allMovies!, error];
}

/// RemoteMoviesLoading is the initial state of the RemoteMoviesBloc.
class RemoteMoviesLoading extends RemoteMoviesState {
  const RemoteMoviesLoading();
}

/// RemoteMoviesDone is the state that is emitted when the movies are fetched from the API.
class RemoteMoviesDone extends RemoteMoviesState {
  const RemoteMoviesDone({required MovieResponseEntity allMovies}) : super(allMovies: allMovies);
}

/// RemoteMoviesError is the state that is emitted when an error occurs while fetching the movies from the API.
class RemoteMoviesError extends RemoteMoviesState {
  const RemoteMoviesError({required DioException error}) : super(error: error);
}
