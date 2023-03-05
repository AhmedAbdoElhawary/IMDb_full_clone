import 'package:dio/dio.dart';
import 'package:imdb/helper/utility/constant.dart';
import 'package:imdb/helper/utility/private_key.dart';
import 'package:imdb/view_models/personal_award/personal_award_details.dart';
import 'package:imdb/view_models/personal_info/personal_info_details.dart';
import 'package:retrofit/retrofit.dart';

part 'personal_info_api.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class PersonalInfoApi {
  factory PersonalInfoApi(Dio dio, {String baseUrl}) = _PersonalInfoApi;

  @GET("Name/{apiKey}/{id}")
  Future<PersonalInfoDetails> getPersonalInfo(@Path() String id,
      {@Path() final String apiKey = apiKey});
  @GET("NameAwards/{apiKey}/{id}")
  Future<PersonalAwardDetails> getPersonalAwards(@Path() String id,
      {@Path() final String apiKey = apiKey});
}
