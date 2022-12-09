import 'package:dio/dio.dart';
import 'package:imdb/helper/utility/constant.dart';
import 'package:imdb/helper/utility/private_keys.dart';
import 'package:imdb/view_models/youtube_trailer/youtube_trailer_details.dart';
import 'package:retrofit/retrofit.dart';

part 'different_calls_from_api.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class DifferentCallsFromApi {
  factory DifferentCallsFromApi(Dio dio, {String baseUrl}) =
      _DifferentCallsFromApi;

  @GET("YouTubeTrailer/{apiKey}/{id}")
  Future<YoutubeTrailerDetails> getYouTubeTrailer(@Path() String id,
      {@Path() final String apiKey = apiKey});
}
