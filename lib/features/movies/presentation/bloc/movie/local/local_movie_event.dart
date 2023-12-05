import 'package:equatable/equatable.dart';
import 'package:flutter_case_yunus6116/features/movies/domain/entities/movie.dart';

abstract class LocalMoviesEvent extends Equatable {
  final MovieEntity? movie;
  const LocalMoviesEvent({this.movie});

  @override
  List<Object?> get props => [movie];
}

class GetSavedMovies extends LocalMoviesEvent {
  const GetSavedMovies();
}

class RemoveMovie extends LocalMoviesEvent {
  const RemoveMovie(MovieEntity movie) : super(movie: movie);
}

class SaveMovie extends LocalMoviesEvent {
  const SaveMovie(MovieEntity movie) : super(movie: movie);
}
