import 'package:dio/dio.dart';
import 'package:imdb/helper/utility/constant.dart';
import 'package:imdb/helper/utility/private_key.dart';
import 'package:imdb/view_models/film/film_sub_details/film_sub_details.dart';
import 'package:retrofit/retrofit.dart';

part 'top_250_films_api.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class Top250FilmsApi {
  factory Top250FilmsApi(Dio dio, {String baseUrl}) = _Top250FilmsApi;

  @GET("Top250Movies/{apiKey}")
  Future<FilmSubDetails> getTop250Movies(
      {@Path() final String apiKey = apiKey});

  @GET("Top250TVs/{apiKey}")
  Future<FilmSubDetails> getTop250TVs({@Path() final String apiKey = apiKey});
}
