import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_case_yunus6116/features/movies/data/data_sources/local/DAO/movie_dao.dart';
import 'package:flutter_case_yunus6116/features/movies/domain/entities/movie.dart';
import 'package:flutter_case_yunus6116/features/movies/presentation/bloc/movie/local/local_movie_bloc.dart';
import 'package:flutter_case_yunus6116/features/movies/domain/usecases/get_saved_movies.dart';
import 'package:flutter_case_yunus6116/features/movies/domain/usecases/remove_movie.dart';
import 'package:flutter_case_yunus6116/features/movies/domain/usecases/save_movie.dart';
import 'package:flutter_case_yunus6116/features/movies/presentation/bloc/movie/local/local_movie_event.dart';
import 'package:flutter_case_yunus6116/features/movies/presentation/bloc/movie/local/local_movie_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockGetSavedMoviesUseCase extends Mock implements GetSavedMoviesUseCase {}

class MockSaveMovieUseCase extends Mock implements SaveMovieUseCase {}

class MockRemoveMovieUseCase extends Mock implements RemoveMovieUseCase {}

class MockMovieDao extends Mock implements MovieDao {}

void main() {
  late LocalMoviesBloc localMoviesBloc;
  late MockGetSavedMoviesUseCase mockGetSavedMoviesUseCase;
  late MockSaveMovieUseCase mockSaveMovieUseCase;
  late MockRemoveMovieUseCase mockRemoveMovieUseCase;

  setUp(() {
    mockGetSavedMoviesUseCase = MockGetSavedMoviesUseCase();
    mockSaveMovieUseCase = MockSaveMovieUseCase();
    mockRemoveMovieUseCase = MockRemoveMovieUseCase();

    localMoviesBloc = LocalMoviesBloc(
      mockGetSavedMoviesUseCase,
      mockSaveMovieUseCase,
      mockRemoveMovieUseCase,
    );
  });

  tearDown(() {
    localMoviesBloc.close();
  });

  group('LocalMoviesBloc', () {
    const movie1 = MovieEntity(
      name: 'Item 1',
      type: "Type A",
      explanation: "This is the first item of Type A",
      imageUrl: "https://image.tmdb.org/t/p/w220_and_h330_face/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg",
    );
    const movie2 = MovieEntity(
      name: 'Item 3',
      type: "Type B",
      explanation: "This is the third item of Type B",
      imageUrl: "https://image.tmdb.org/t/p/w220_and_h330_face/mBaXZ95R2OxueZhvQbcEWy2DqyO.jpg",
    );
    final movieList = [movie1, movie2];

    blocTest<LocalMoviesBloc, LocalMoviesState>(
      'emits [LocalMoviesDone] when GetSavedMovies is added',
      build: () {
        when(mockGetSavedMoviesUseCase()).thenAnswer((_) => Future.value(movieList));
        return localMoviesBloc;
      },
      act: (bloc) => bloc.add(const GetSavedMovies()),
      expect: () => [LocalMoviesDone(movieList)],
    );

    blocTest<LocalMoviesBloc, LocalMoviesState>(
      'emits [LocalMoviesDone] when SaveMovie is added',
      build: () {
        when(mockSaveMovieUseCase(params: movie1)).thenAnswer((_) => Future.value(null));
        when(mockGetSavedMoviesUseCase()).thenAnswer((_) => Future.value(movieList));
        return localMoviesBloc;
      },
      act: (bloc) => bloc.add(const SaveMovie(movie1)),
      expect: () => [LocalMoviesDone(movieList)],
    );

    blocTest<LocalMoviesBloc, LocalMoviesState>(
      'emits [LocalMoviesDone] when RemoveMovie is added',
      build: () {
        when(mockRemoveMovieUseCase(params: movie1)).thenAnswer((_) => Future.value(null));
        when(mockGetSavedMoviesUseCase()).thenAnswer((_) => Future.value(movieList));
        return localMoviesBloc;
      },
      act: (bloc) => bloc.add(const RemoveMovie(movie1)),
      expect: () => [LocalMoviesDone(movieList)],
    );
  });
}
