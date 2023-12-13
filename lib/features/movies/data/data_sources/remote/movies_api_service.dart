import 'package:dio/dio.dart';
import '../../models/movie_response.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

import '../../../../../core/constants/constants.dart';

part 'movies_api_service.g.dart';

/// Movie Api Service (Retrofit)
@RestApi(baseUrl: moviesAPIBaseURL)
abstract class MovieApiService {
  factory MovieApiService(Dio dio) = _MovieApiService;

  @GET('interview.json')
  Future<HttpResponse<MovieResponseModel>> getAllMovies();
}
