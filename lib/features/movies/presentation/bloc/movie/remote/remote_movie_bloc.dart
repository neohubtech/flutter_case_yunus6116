import 'package:flutter/foundation.dart';
import 'package:flutter_case_yunus6116/core/resources/data_state.dart';
import 'package:flutter_case_yunus6116/features/movies/domain/usecases/get_all_movies.dart';

import 'remote_movie_event.dart';
import 'remote_movie_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// RemoteMoviesBloc is the BLoC that is responsible for the remote movies.
class RemoteMoviesBloc extends Bloc<RemoteMoviesEvent, RemoteMoviesState> {
  final GetAllMoviesUseCase _getAllMoviesUseCase;
  RemoteMoviesBloc(this._getAllMoviesUseCase) : super(const RemoteMoviesLoading()) {
    on<GetAllMovies>(onGetAllMovies);
  }

  /// This function is called when the [GetAllMovies] event is added to the bloc.
  Future<void> onGetAllMovies(GetAllMovies event, Emitter<RemoteMoviesState> emit) async {
    final dataState =
        await _getAllMoviesUseCase(); // _getAllMoviesUseCase.call() is equal to _getAllMoviesUseCase() in Dart (Object.call() == Object())
    if (dataState is DataSuccess &&
        dataState.data!.bannerList != null &&
        dataState.data!.movieList != null &&
        dataState.data!.bannerList!.isNotEmpty &&
        dataState.data!.movieList!.isNotEmpty) {
      emit(RemoteMoviesDone(allMovies: dataState.data!));
    }

    if (dataState is DataFailed) {
      debugPrint("onGetAllMovies DataFailed: ${dataState.error}");
      emit(RemoteMoviesError(error: dataState.error!));
    }
  }
}
