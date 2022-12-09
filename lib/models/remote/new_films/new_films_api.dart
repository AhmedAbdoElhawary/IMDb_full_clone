import 'package:dio/dio.dart';
import 'package:imdb/helper/utility/constant.dart';
import 'package:imdb/helper/utility/private_keys.dart';
import 'package:imdb/view_models/in_theaters/new_film_details.dart';
import 'package:retrofit/retrofit.dart';

part 'new_films_api.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class NewFilmsApi {
  factory NewFilmsApi(Dio dio, {String baseUrl}) = _NewFilmsApi;

  @GET("InTheaters/{apiKey}")
  Future<NewFilmDetails> getInTheaters({@Path() final String apiKey = apiKey});

  @GET("ComingSoon/{apiKey}")
  Future<NewFilmDetails> getComingSoon({@Path() final String apiKey = apiKey});
}
