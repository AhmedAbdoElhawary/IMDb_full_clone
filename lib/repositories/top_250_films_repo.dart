import 'package:imdb/helper/functions/api_result.dart';
import 'package:imdb/helper/functions/network_exceptions.dart';
import 'package:imdb/models/remote/top_250_films/top_250_films_api.dart';
import 'package:imdb/view_models/film/film_sub_details/film_sub_details.dart';

class Top250FilmsRepo {
  final Top250FilmsApi _top250filmsApi;
  Top250FilmsRepo(this._top250filmsApi);

  Future<ApiResult<FilmSubDetails>> getTop250Movies() async {
    try {
      FilmSubDetails mostPopularMovies =
          await _top250filmsApi.getTop250Movies();
      return ApiResult.success(mostPopularMovies);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<FilmSubDetails>> getTop250TVs() async {
    try {
      FilmSubDetails mostPopularTVs = await _top250filmsApi.getTop250TVs();
      return ApiResult.success(mostPopularTVs);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }
}
