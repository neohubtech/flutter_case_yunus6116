import 'package:equatable/equatable.dart';
import 'package:flutter_case_yunus6116/features/movies/domain/entities/movie.dart';

abstract class LocalMoviesState extends Equatable {
  final List<MovieEntity>? movies;

  const LocalMoviesState({this.movies});

  @override
  List<Object> get props => [movies!];
}

class LocalMoviesLoading extends LocalMoviesState {
  const LocalMoviesLoading();
}

class LocalMoviesDone extends LocalMoviesState {
  const LocalMoviesDone(List<MovieEntity> movies) : super(movies: movies);
}
