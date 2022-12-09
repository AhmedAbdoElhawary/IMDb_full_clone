import 'package:imdb/helper/functions/api_result.dart';
import 'package:imdb/helper/functions/network_exceptions.dart';
import 'package:imdb/models/remote/most_popular_films/most_popular_films_api.dart';
import 'package:imdb/view_models/film/film_sub_details/film_sub_details.dart';

class MostPopularFilmsRepo {
  final MostPopularFilmsApi _mostPopularFilmsApi;
  MostPopularFilmsRepo(this._mostPopularFilmsApi);

  Future<ApiResult<FilmSubDetails>> getMostPopularMovies() async {
    try {
      FilmSubDetails mostPopularMovies =
          await _mostPopularFilmsApi.getMostPopularMovies();
      return ApiResult.success(mostPopularMovies);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<FilmSubDetails>> getMostPopularTVs() async {
    try {
      FilmSubDetails mostPopularTVs =
          await _mostPopularFilmsApi.getMostPopularTVs();
      return ApiResult.success(mostPopularTVs);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }
}
