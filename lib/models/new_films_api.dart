import 'package:dio/dio.dart';
import 'package:imdb/helper/utility/private_keys.dart';
import 'package:imdb/view_models/in_theaters/new_film_details.dart';
import 'package:retrofit/retrofit.dart';

import '../helper/utility/constant.dart';

part 'new_films_api.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class NewFilmsApi {
  factory NewFilmsApi(Dio dio, {String baseUrl}) = _NewFilmsApi;

  @GET("InTheaters/{apiKey}")
  Future<List<NewFilmDetails>> getInTheaters({@Path() String apiKey = apiKey});

  @GET("ComingSoon/{apiKey}")
  Future<List<NewFilmDetails>> getComingSoon({@Path() String apiKey = apiKey});
}
