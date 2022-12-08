import 'package:imdb/helper/functions/api_result.dart';
import 'package:imdb/helper/functions/network_exceptions.dart';
import 'package:imdb/models/box_office.dart';
import 'package:imdb/view_models/box_office/box_office_details.dart';
import 'package:imdb/view_models/box_office_of_all_time/box_office_of_all_time_details.dart';

class BoxOfficeRepo {
  final BoxOfficeApi _boxOfficeApi;
  BoxOfficeRepo(this._boxOfficeApi);

  Future<ApiResult<List<BoxOfficeDetails>>> getBoxOffice() async {
    try {
      List<BoxOfficeDetails> data = await _boxOfficeApi.getBoxOffice();
      return ApiResult.success(data);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<List<BoxOfficeOfAllTimeDetails>>>
      getBoxOfficeAllTime() async {
    try {
      List<BoxOfficeOfAllTimeDetails> data =
          await _boxOfficeApi.getBoxOfficeAllTime();
      return ApiResult.success(data);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }
}
