import 'package:imdb/helper/functions/api_result.dart';
import 'package:imdb/helper/functions/network_exceptions.dart';
import 'package:imdb/models/most_popular_films_api.dart';
import 'package:imdb/view_models/film/film_details.dart';

class MostPopularFilmsRepo {
  final MostPopularFilmsApi _mostPopularFilmsApi;
  MostPopularFilmsRepo(this._mostPopularFilmsApi);

  Future<ApiResult<FilmDetails>> getMostPopularMovies() async {
    try {
      FilmDetails mostPopularMovies =
          await _mostPopularFilmsApi.getMostPopularMovies();
      return ApiResult.success(mostPopularMovies);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<FilmDetails>> getMostPopularTVs() async {
    try {
      FilmDetails mostPopularTVs =
          await _mostPopularFilmsApi.getMostPopularTVs();
      return ApiResult.success(mostPopularTVs);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }
}
