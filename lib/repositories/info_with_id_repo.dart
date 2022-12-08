import 'package:imdb/helper/functions/api_result.dart';
import 'package:imdb/helper/functions/network_exceptions.dart';
import 'package:imdb/models/info_with_id_api.dart';
import 'package:imdb/view_models/award_info/award_info_details.dart';
import 'package:imdb/view_models/personal_info/personal_info_details.dart';
import 'package:imdb/view_models/youtube_trailer/youtube_trailer_details.dart';

class InfoWithIdRepo {
  final InfoWithIdApi _infoWithIdApi;
  InfoWithIdRepo(this._infoWithIdApi);

  Future<ApiResult<List<AwardInfoDetails>>> getPersonalAwards(String id) async {
    try {
      List<AwardInfoDetails> data = await _infoWithIdApi.getPersonalAwards(id);
      return ApiResult.success(data);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<List<PersonalInfoDetails>>> getPersonalInfo(
      String id) async {
    try {
      List<PersonalInfoDetails> data = await _infoWithIdApi.getPersonalInfo(id);
      return ApiResult.success(data);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<List<YoutubeTrailerDetails>>> getYouTubeTrailer(
      String id) async {
    try {
      List<YoutubeTrailerDetails> data =
          await _infoWithIdApi.getYouTubeTrailer(id);
      return ApiResult.success(data);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }
}
