import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_case_yunus6116/features/movies/domain/usecases/get_saved_movies.dart';
import 'package:flutter_case_yunus6116/features/movies/domain/usecases/remove_movie.dart';
import 'package:flutter_case_yunus6116/features/movies/domain/usecases/save_movie.dart';
import 'package:flutter_case_yunus6116/features/movies/presentation/bloc/movie/local/local_movie_event.dart';
import 'package:flutter_case_yunus6116/features/movies/presentation/bloc/movie/local/local_movie_state.dart';

/// LocalMoviesBloc is the bloc that is responsible for the local movies.
class LocalMoviesBloc extends Bloc<LocalMoviesEvent, LocalMoviesState> {
  final GetSavedMoviesUseCase _getSavedMoviesUseCase;
  final SaveMovieUseCase _saveMovieUseCase;
  final RemoveMovieUseCase _removeMovieUseCase;

  LocalMoviesBloc(this._getSavedMoviesUseCase, this._saveMovieUseCase, this._removeMovieUseCase)
      : super(const LocalMoviesLoading()) {
    on<GetSavedMovies>(onGetSavedMovies);
    on<RemoveMovie>(onRemoveMovie);
    on<SaveMovie>(onSaveMovie);
  }

  /// onGetSavedMovies is called when the user wants to get the saved movies.
  void onGetSavedMovies(GetSavedMovies event, Emitter<LocalMoviesState> emit) async {
    final movies = await _getSavedMoviesUseCase();
    emit(LocalMoviesDone(movies));
  }

  /// onSaveMovie is called when the user wants to save a movie.
  void onSaveMovie(SaveMovie saveMovie, Emitter<LocalMoviesState> emit) async {
    await _saveMovieUseCase(params: saveMovie.movie);
    final movies = await _getSavedMoviesUseCase();
    emit(LocalMoviesDone(movies));
  }

  /// onRemoveMovie is called when the user wants to remove a movie.
  void onRemoveMovie(RemoveMovie removeMovie, Emitter<LocalMoviesState> emit) async {
    await _removeMovieUseCase(params: removeMovie.movie);
    final movies = await _getSavedMoviesUseCase();
    emit(LocalMoviesDone(movies));
  }
}
