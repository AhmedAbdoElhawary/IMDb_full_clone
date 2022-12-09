import 'package:imdb/helper/functions/api_result.dart';
import 'package:imdb/helper/functions/network_exceptions.dart';
import 'package:imdb/models/remote/different_calls_from/different_calls_from_api.dart';
import 'package:imdb/models/remote/personal_info/personal_info_api.dart';
import 'package:imdb/view_models/personal_award/personal_award_details.dart';
import 'package:imdb/view_models/personal_info/personal_info_details.dart';
import 'package:imdb/view_models/youtube_trailer/youtube_trailer_details.dart';

class InfoWithIdRepo {
  final DifferentCallsFromApi _differentCallsFromApi;
  final PersonalInfoApi _personalInfoApi;

  InfoWithIdRepo(this._personalInfoApi, this._differentCallsFromApi);

  Future<ApiResult<PersonalAwardDetails>> getPersonalAwards(String id) async {
    try {
      PersonalAwardDetails data = await _personalInfoApi.getPersonalAwards(id);
      return ApiResult.success(data);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<PersonalInfoDetails>> getPersonalInfo(String id) async {
    try {
      PersonalInfoDetails data = await _personalInfoApi.getPersonalInfo(id);
      return ApiResult.success(data);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<YoutubeTrailerDetails>> getYouTubeTrailer(String id) async {
    try {
      YoutubeTrailerDetails data =
          await _differentCallsFromApi.getYouTubeTrailer(id);
      return ApiResult.success(data);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }
}
