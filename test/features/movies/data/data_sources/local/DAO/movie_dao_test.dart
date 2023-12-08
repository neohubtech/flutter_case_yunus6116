import 'package:flutter_case_yunus6116/features/movies/data/data_sources/local/DAO/movie_dao.dart';
import 'package:flutter_case_yunus6116/features/movies/data/data_sources/local/app_database.dart';
import 'package:flutter_case_yunus6116/features/movies/data/data_sources/remote/movies_api_service.dart';
import 'package:flutter_case_yunus6116/features/movies/data/models/movie.dart';
import 'package:flutter_case_yunus6116/features/movies/data/repository/movie_repository_impl.dart';
import 'package:flutter_case_yunus6116/features/movies/domain/entities/movie.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockMovieDao extends Mock implements MovieDao {}

class MockMovieApiService extends Mock implements MovieApiService {}

class MockAppDatabase extends Mock implements AppDatabase {
  @override
  MovieDao get movieDao => MockMovieDao(); // MockMovieDao kullanarak gerçek bir MovieDao nesnesi sağlıyoruz.
}

void main() {
  late MovieRepositoryImpl movieRepository;
  late MockMovieDao mockMovieDao;
  late MockMovieApiService mockMovieApiService;
  late MockAppDatabase mockAppDatabase;

  setUp(() {
    mockMovieDao = MockMovieDao();
    mockMovieApiService = MockMovieApiService();
    mockAppDatabase = MockAppDatabase();
    movieRepository = MovieRepositoryImpl(mockMovieApiService, mockAppDatabase);
  });

  group('MovieRepositoryImpl', () {
    test('should get saved movies from the local database', () async {
      // Arrange
      final expectedMovies = [
        const MovieEntity(
          name: 'Item 1',
          type: "Type A",
          explanation: "This is the first item of Type A",
          imageUrl: "https://image.tmdb.org/t/p/w220_and_h330_face/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg",
        ),
        const MovieEntity(
          name: 'Item 3',
          type: "Type B",
          explanation: "This is the third item of Type B",
          imageUrl: "https://image.tmdb.org/t/p/w220_and_h330_face/mBaXZ95R2OxueZhvQbcEWy2DqyO.jpg",
        ),
      ];

      when(mockMovieDao.getMovies())
          .thenAnswer((_) async => expectedMovies.map((e) => MovieModel.fromEntity(e)).toList());

      // Act
      final result = await movieRepository.getSavedMovies();

      // Assert
      expect(result, equals(expectedMovies));
      verify(mockMovieDao.getMovies()).called(1);
      verifyNoMoreInteractions(mockMovieDao);
    });

    test('should remove a movie from the local database', () async {
      // Arrange
      const movieToRemove = MovieEntity(
        name: 'Item 1',
        type: "Type A",
        explanation: "This is the first item of Type A",
        imageUrl: "https://image.tmdb.org/t/p/w220_and_h330_face/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg",
      );

      // Act
      await movieRepository.removeMovie(movieToRemove);

      // Assert
      verify(mockMovieDao.deleteMovie(MovieModel.fromEntity(movieToRemove))).called(1);
      verifyNoMoreInteractions(mockMovieDao);
    });

    test('should save a movie to the local database', () async {
      // Arrange
      const movieToSave = MovieEntity(
        name: 'Item 1',
        type: "Type A",
        explanation: "This is the first item of Type A",
        imageUrl: "https://image.tmdb.org/t/p/w220_and_h330_face/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg",
      );

      // Act
      await movieRepository.saveMovie(movieToSave);

      // Assert
      verify(mockMovieDao.insertMovie(MovieModel.fromEntity(movieToSave))).called(1);
      verifyNoMoreInteractions(mockMovieDao);
    });

    // Diğer test senaryolarını buraya ekleyebilirsiniz.
  });
}
