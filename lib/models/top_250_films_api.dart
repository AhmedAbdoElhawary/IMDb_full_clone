import 'package:dio/dio.dart';
import 'package:imdb/helper/utility/private_keys.dart';
import 'package:imdb/view_models/film/film_details.dart';
import 'package:retrofit/retrofit.dart';

import '../helper/utility/constant.dart';

part 'top_250_films_api.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class Top250FilmsApi{
    factory Top250FilmsApi(Dio dio, {String baseUrl}) = _Top250FilmsApi;


  @GET("Top250Movies/{apiKey}")
  Future<FilmDetails> getTop250Movies(
      {@Path() String apiKey = apiKey});

  @GET("Top250TVs/{apiKey}")
  Future<FilmDetails> getTop250TVs(
      {@Path() String apiKey = apiKey});


}