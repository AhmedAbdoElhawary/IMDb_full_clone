import 'package:imdb/helper/functions/api_result.dart';
import 'package:imdb/helper/functions/network_exceptions.dart';
import 'package:imdb/models/remote/different_calls_from/different_calls_from_api.dart';
import 'package:imdb/view_models/youtube_trailer/youtube_trailer_details.dart';

class DifferentCallsRepo {
  final DifferentCallsFromApi _differentCallsFromApi;

  DifferentCallsRepo(this._differentCallsFromApi);

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
