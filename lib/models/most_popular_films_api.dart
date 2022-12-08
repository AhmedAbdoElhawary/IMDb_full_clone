import 'package:dio/dio.dart';
import 'package:imdb/helper/utility/private_keys.dart';
import 'package:imdb/view_models/film/film_details.dart';
import 'package:retrofit/retrofit.dart';

import '../helper/utility/constant.dart';

part 'most_popular_films_api.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class MostPopularFilmsApi {
  factory MostPopularFilmsApi(Dio dio, {String baseUrl}) = _MostPopularFilmsApi;

  @GET("MostPopularMovies/{apiKey}")
  Future<FilmDetails> getMostPopularMovies(
      {@Path() String apiKey = apiKey});

  @GET("MostPopularTVs/{apiKey}")
  Future<FilmDetails> getMostPopularTVs({@Path() String apiKey = apiKey});
}
