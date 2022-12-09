import 'package:imdb/helper/functions/api_result.dart';
import 'package:imdb/helper/functions/network_exceptions.dart';
import 'package:imdb/models/remote/new_films/new_films_api.dart';
import 'package:imdb/view_models/in_theaters/new_film_details.dart';

class NewFilmsRepo {
  final NewFilmsApi _newFilmsApi;
  NewFilmsRepo(this._newFilmsApi);

  Future<ApiResult<NewFilmDetails>> getComingSoon() async {
    try {
      NewFilmDetails data = await _newFilmsApi.getComingSoon();
      return ApiResult.success(data);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<NewFilmDetails>> getInTheaters() async {
    try {
      NewFilmDetails data = await _newFilmsApi.getInTheaters();
      return ApiResult.success(data);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }
}
