import 'package:equatable/equatable.dart';
import 'package:flutter_case_yunus6116/features/movies/domain/entities/movie.dart';

/// LocalMoviesEvent is the event class for the LocalMoviesBloc.
abstract class LocalMoviesEvent extends Equatable {
  final MovieEntity? movie;
  const LocalMoviesEvent({this.movie});

  @override
  List<Object?> get props => [movie];
}

/// GetSavedMovies is called when the user wants to get the saved movies.
class GetSavedMovies extends LocalMoviesEvent {
  const GetSavedMovies();
}

/// RemoveMovie is called when the user wants to remove a movie.
class RemoveMovie extends LocalMoviesEvent {
  const RemoveMovie(MovieEntity movie) : super(movie: movie);
}

/// SaveMovie is called when the user wants to save a movie.
class SaveMovie extends LocalMoviesEvent {
  const SaveMovie(MovieEntity movie) : super(movie: movie);
}
