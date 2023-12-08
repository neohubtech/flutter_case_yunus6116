import 'package:equatable/equatable.dart';
import '../../../../domain/entities/movie.dart';

/// LocalMoviesEvent is the event class for the LocalMoviesBloc.
abstract class LocalMoviesState extends Equatable {
  final List<MovieEntity>? movies;

  const LocalMoviesState({this.movies});

  @override
  List<Object> get props => [movies!];
}

/// LocalMoviesLoading is called when the user wants to get the saved movies.
class LocalMoviesLoading extends LocalMoviesState {
  const LocalMoviesLoading();
}

/// LocalMoviesDone is called when the user wants to remove a movie.
class LocalMoviesDone extends LocalMoviesState {
  const LocalMoviesDone(List<MovieEntity> movies) : super(movies: movies);
}
