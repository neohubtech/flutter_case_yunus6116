import 'package:dio/dio.dart';
import 'package:flutter_case_yunus6116/features/movies/data/data_sources/local/app_database.dart';
import 'package:flutter_case_yunus6116/features/movies/data/data_sources/remote/movies_api_service.dart';
import 'package:flutter_case_yunus6116/features/movies/data/repository/movie_repository_impl.dart';
import 'package:flutter_case_yunus6116/features/movies/domain/repository/movie_repository.dart';
import 'package:flutter_case_yunus6116/features/movies/domain/usecases/get_all_movies.dart';
import 'package:flutter_case_yunus6116/features/movies/domain/usecases/get_saved_movies.dart';
import 'package:flutter_case_yunus6116/features/movies/domain/usecases/remove_movie.dart';
import 'package:flutter_case_yunus6116/features/movies/domain/usecases/save_movie.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Data sources
  sl.registerSingleton<MovieApiService>(MovieApiService(sl()));

  // Repository
  sl.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(sl(), sl()));

  // Use cases
  sl.registerLazySingleton(() => GetAllMoviesUseCase(sl()));

  sl.registerLazySingleton(() => GetSavedMoviesUseCase(sl()));

  sl.registerLazySingleton(() => SaveMovieUseCase(sl()));

  sl.registerLazySingleton(() => RemoveMovieUseCase(sl()));
}
