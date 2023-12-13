import 'package:flutter_case_yunus6116/features/movies/domain/entities/movie.dart';
import 'package:flutter_case_yunus6116/features/movies/domain/repository/movie_repository.dart';
import 'package:flutter_case_yunus6116/features/movies/domain/usecases/get_saved_movies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

@GenerateMocks(<Type>[MockMovieRepository])
void main() {
  late GetSavedMoviesUseCase getSavedMoviesUseCase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    getSavedMoviesUseCase = GetSavedMoviesUseCase(mockMovieRepository);
  });

  test('should get saved movies from the repository', () async {
    // Arrange
    Future<List<MovieEntity>> expectedMovies = Future.value([
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
    ]);

    when(mockMovieRepository.getSavedMovies()).thenAnswer((_) async => expectedMovies);

    // Act
    final result = await getSavedMoviesUseCase();

    // Assert
    expect(result, equals(expectedMovies));
    verify(mockMovieRepository.getSavedMovies()).called(1);
    verifyNoMoreInteractions(mockMovieRepository);
  });
}
