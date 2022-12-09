import 'package:imdb/helper/functions/api_result.dart';
import 'package:imdb/helper/functions/network_exceptions.dart';
import 'package:imdb/models/remote/film_info/film_info_api.dart';
import 'package:imdb/view_models/film/faq/faq_details.dart';
import 'package:imdb/view_models/film/film_award/film_award_details.dart';
import 'package:imdb/view_models/film/film_details/film_details.dart';
import 'package:imdb/view_models/film/full_cast/full_cast_details.dart';
import 'package:imdb/view_models/film/image/image_details.dart';
import 'package:imdb/view_models/film/metacritic_reviews/metacritic_reviews_details.dart';
import 'package:imdb/view_models/film/poster/poster_details.dart';
import 'package:imdb/view_models/film/rating/rating_details.dart';
import 'package:imdb/view_models/film/reviews/reviews_details.dart';
import 'package:imdb/view_models/film/season_episode/season_episode.dart';
import 'package:imdb/view_models/film/trailer/trailer_details.dart';
import 'package:imdb/view_models/film/user_ratings/user_ratings_details.dart';

class FilmInfoRepo {
  final FilmInfoApi _filmInfoApi;

  FilmInfoRepo(this._filmInfoApi);

  Future<ApiResult<FilmAwardDetails>> getAwardsOfFilm(String id) async {
    try {
      FilmAwardDetails data = await _filmInfoApi.getAwardsOfFilm(id);
      return ApiResult.success(data);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<FAQDetails>> getFAQOfFilm(String id) async {
    try {
      FAQDetails data = await _filmInfoApi.getFAQOfFilm(id);
      return ApiResult.success(data);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<FilmDetails>> getFilmInfo(String id) async {
    try {
      FilmDetails data = await _filmInfoApi.getFilmInfo(id);
      return ApiResult.success(data);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<FullCast>> getFullCastOfFilm(String id) async {
    try {
      FullCast data = await _filmInfoApi.getFullCastOfFilm(id);
      return ApiResult.success(data);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<ImageDetails>> getFullImagesOfFilm(String id) async {
    try {
      ImageDetails data = await _filmInfoApi.getFullImagesOfFilm(id);
      return ApiResult.success(data);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<MetacriticReviewsDetails>> getMetacriticReviewsOfFilm(
      String id) async {
    try {
      MetacriticReviewsDetails data =
          await _filmInfoApi.getMetacriticReviewsOfFilm(id);
      return ApiResult.success(data);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<Posters>> getPostersOfFilm(String id) async {
    try {
      Posters data = await _filmInfoApi.getPostersOfFilm(id);
      return ApiResult.success(data);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<RatingDetails>> getRatingOfFilm(String id) async {
    try {
      RatingDetails data = await _filmInfoApi.getRatingOfFilm(id);
      return ApiResult.success(data);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<ReviewsDetails>> getReviewsOfFilm(String id) async {
    try {
      ReviewsDetails data = await _filmInfoApi.getReviewsOfFilm(id);
      return ApiResult.success(data);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<SeasonEpisode>> getSeasonEpisodesOfSeries({
    required String id,
    String seasonNumber = "1",
  }) async {
    try {
      SeasonEpisode data = await _filmInfoApi.getSeasonEpisodesOfSeries(
          id: id, seasonNumber: seasonNumber);
      return ApiResult.success(data);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<ImageDetails>> getSubImagesOfFilm(String id) async {
    try {
      ImageDetails data = await _filmInfoApi.getSubImagesOfFilm(id);
      return ApiResult.success(data);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<TrailerDetails>> getTrailerOfFilm(String id) async {
    try {
      TrailerDetails data = await _filmInfoApi.getTrailerOfFilm(id);
      return ApiResult.success(data);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<UserRatingsDetails>> getUserRatingsOfFilm(String id) async {
    try {
      UserRatingsDetails data = await _filmInfoApi.getUserRatingsOfFilm(id);
      return ApiResult.success(data);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<RatingDetails>> getWikipediaPlotOfFilm(String id) async {
    try {
      RatingDetails data = await _filmInfoApi.getWikipediaPlotOfFilm(id);
      return ApiResult.success(data);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }
}
