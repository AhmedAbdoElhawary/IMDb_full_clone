import 'package:imdb/helper/functions/api_result.dart';
import 'package:imdb/helper/functions/network_exceptions.dart';
import 'package:imdb/models/remote/search/search_api.dart';
import 'package:imdb/view_models/search_in_all/search_in_all_details.dart';

class SearchRepo {
  final SearchApi _searchApi;
  SearchRepo(this._searchApi);

  Future<ApiResult<SearchInAllDetails>> getSearchInAllInfo(String expression) async {
    try {
      SearchInAllDetails data = await _searchApi.getSearchInAllInfo(expression);
      return ApiResult.success(data);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }
}
