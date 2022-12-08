import 'package:dio/dio.dart';
import 'package:imdb/helper/utility/private_keys.dart';
import 'package:imdb/view_models/award_info/award_info_details.dart';
import 'package:imdb/view_models/personal_info/personal_info_details.dart';
import 'package:imdb/view_models/youtube_trailer/youtube_trailer_details.dart';
import 'package:retrofit/retrofit.dart';

import '../helper/utility/constant.dart';

part 'info_with_id_api.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class InfoWithIdApi {
  factory InfoWithIdApi(Dio dio, {String baseUrl}) = _InfoWithIdApi;

  @GET("Name/{apiKey}/{id}")
  Future<List<PersonalInfoDetails>> getPersonalInfo(@Path() String id,
      {@Path() String apiKey = apiKey});
  @GET("NameAwards/{apiKey}/{id}")
  Future<List<AwardInfoDetails>> getPersonalAwards(@Path() String id,
      {@Path() String apiKey = apiKey});

  @GET("YouTubeTrailer/{apiKey}/{id}")
  Future<List<YoutubeTrailerDetails>> getYouTubeTrailer(@Path() String id,
      {@Path() String apiKey = apiKey});
}
