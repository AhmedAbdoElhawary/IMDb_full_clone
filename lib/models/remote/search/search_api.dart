import 'package:dio/dio.dart';
import 'package:imdb/helper/utility/constant.dart';
import 'package:imdb/helper/utility/private_keys.dart';
import 'package:imdb/view_models/search_in_all/search_in_all_details.dart';
import 'package:retrofit/retrofit.dart';

part 'search_api.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class SearchApi {
  factory SearchApi(Dio dio, {String baseUrl}) = _SearchApi;

  @GET("SearchAll/{apiKey}/{expression}")
  Future<SearchInAllDetails> getSearchInAllInfo(@Path() String expression,
      {@Path() final String apiKey = apiKey});
}
