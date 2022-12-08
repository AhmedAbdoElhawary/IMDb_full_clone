import 'package:imdb/helper/functions/api_result.dart';
import 'package:imdb/helper/functions/network_exceptions.dart';
import 'package:imdb/models/top_250_films_api.dart';
import 'package:imdb/view_models/film/film_details.dart';

class Top250FilmsRepo {
  final Top250FilmsApi _top250filmsApi;
  Top250FilmsRepo(this._top250filmsApi);

  Future<ApiResult<FilmDetails>> getTop250Movies() async {
    try {
      FilmDetails mostPopularMovies =
          await _top250filmsApi.getTop250Movies();
      return ApiResult.success(mostPopularMovies);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<FilmDetails>> getTop250TVs() async {
    try {
      FilmDetails mostPopularTVs = await _top250filmsApi.getTop250TVs();
      return ApiResult.success(mostPopularTVs);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }
}
