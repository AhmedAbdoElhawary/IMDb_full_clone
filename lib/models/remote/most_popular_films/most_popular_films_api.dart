import 'package:dio/dio.dart';
import 'package:imdb/helper/utility/constant.dart';
import 'package:imdb/helper/utility/private_keys.dart';
import 'package:imdb/view_models/film/film_sub_details/film_sub_details.dart';
import 'package:retrofit/retrofit.dart';

part 'most_popular_films_api.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class MostPopularFilmsApi {
  factory MostPopularFilmsApi(Dio dio, {String baseUrl}) = _MostPopularFilmsApi;

  @GET("MostPopularMovies/{apiKey}")
  Future<FilmSubDetails> getMostPopularMovies(
      {@Path() final String apiKey = apiKey});

  @GET("MostPopularTVs/{apiKey}")
  Future<FilmSubDetails> getMostPopularTVs(
      {@Path() final String apiKey = apiKey});
}
