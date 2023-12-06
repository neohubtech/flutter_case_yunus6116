import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_case_yunus6116/features/movies/domain/usecases/get_saved_movies.dart';
import 'package:flutter_case_yunus6116/features/movies/domain/usecases/remove_movie.dart';
import 'package:flutter_case_yunus6116/features/movies/domain/usecases/save_movie.dart';
import 'package:flutter_case_yunus6116/features/movies/presentation/bloc/movie/local/local_movie_event.dart';
import 'package:flutter_case_yunus6116/features/movies/presentation/bloc/movie/local/local_movie_state.dart';

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

  void onGetSavedMovies(GetSavedMovies event, Emitter<LocalMoviesState> emit) async {
    final movies = await _getSavedMoviesUseCase();
    emit(LocalMoviesDone(movies));
  }

  void onSaveMovie(SaveMovie saveMovie, Emitter<LocalMoviesState> emit) async {
    await _saveMovieUseCase(params: saveMovie.movie);
    final movies = await _getSavedMoviesUseCase();
    emit(LocalMoviesDone(movies));
  }

  void onRemoveMovie(RemoveMovie removeMovie, Emitter<LocalMoviesState> emit) async {
    await _removeMovieUseCase(params: removeMovie.movie);
    final movies = await _getSavedMoviesUseCase();
    emit(LocalMoviesDone(movies));
  }
}
