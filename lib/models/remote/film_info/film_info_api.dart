import 'package:dio/dio.dart';
import 'package:imdb/helper/utility/constant.dart';
import 'package:imdb/helper/utility/private_key.dart';
import 'package:imdb/view_models/film/faq/faq_details.dart';
import 'package:imdb/view_models/film/film_details/film_details.dart';
import 'package:imdb/view_models/film/full_cast/full_cast_details.dart';
import 'package:imdb/view_models/film/film_award/film_award_details.dart';
import 'package:imdb/view_models/film/image/image_details.dart';
import 'package:imdb/view_models/film/metacritic_reviews/metacritic_reviews_details.dart';
import 'package:imdb/view_models/film/poster/poster_details.dart';
import 'package:imdb/view_models/film/rating/rating_details.dart';
import 'package:imdb/view_models/film/reviews/reviews_details.dart';
import 'package:imdb/view_models/film/season_episode/season_episode.dart';
import 'package:imdb/view_models/film/trailer/trailer_details.dart';
import 'package:imdb/view_models/film/user_ratings/user_ratings_details.dart';
import 'package:retrofit/retrofit.dart';

part 'film_info_api.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class FilmInfoApi {
  factory FilmInfoApi(Dio dio, {String baseUrl}) = _FilmInfoApi;

  // ignore: todo
  /// TODO if there is anything wrong add this in the end of bellow url:
  /// FullActor,FullCast,Posters,Images,Trailer,Ratings,Wikipedia,

  @GET("Title/{apiKey}/{id}/Images,Trailer,Ratings,")
  Future<FilmDetails> getFilmInfo(@Path() String id,
      {@Path() final String apiKey = apiKey});

  @GET("FullCast/{apiKey}/{id}")
  Future<FullCast> getFullCastOfFilm(@Path() String id,
      {@Path() final String apiKey = apiKey});

  @GET("Posters/{apiKey}/{id}")
  Future<Posters> getPostersOfFilm(@Path() String id,
      {@Path() final String apiKey = apiKey});

  @GET("Images/{apiKey}/{id}/Short")
  Future<ImageDetails> getSubImagesOfFilm(@Path() String id,
      {@Path() final String apiKey = apiKey});

  @GET("Images/{apiKey}/{id}/Full")
  Future<ImageDetails> getFullImagesOfFilm(@Path() String id,
      {@Path() final String apiKey = apiKey});

  @GET("Trailer/{apiKey}/{id}")
  Future<TrailerDetails> getTrailerOfFilm(@Path() String id,
      {@Path() final String apiKey = apiKey});

  @GET("Ratings/{apiKey}/{id}")
  Future<RatingDetails> getRatingOfFilm(@Path() String id,
      {@Path() final String apiKey = apiKey});

  @GET("UserRatings/{apiKey}/{id}")
  Future<UserRatingsDetails> getUserRatingsOfFilm(@Path() String id,
      {@Path() final String apiKey = apiKey});

  @GET("SeasonEpisodes/{apiKey}/{id}/{seasonNumber}")
  Future<SeasonEpisode> getSeasonEpisodesOfSeries(
      {@Path() final String apiKey = apiKey,
      @Path() required String id,
      @Path() required String seasonNumber});

  @GET("Wikipedia/{apiKey}/{id}")
  Future<RatingDetails> getWikipediaPlotOfFilm(@Path() String id,
      {@Path() final String apiKey = apiKey});

  @GET("Reviews/{apiKey}/{id}")
  Future<ReviewsDetails> getReviewsOfFilm(@Path() String id,
      {@Path() final String apiKey = apiKey});

  @GET("MetacriticReviews/{apiKey}/{id}")
  Future<MetacriticReviewsDetails> getMetacriticReviewsOfFilm(@Path() String id,
      {@Path() final String apiKey = apiKey});

  @GET("FAQ/{apiKey}/{id}")
  Future<FAQDetails> getFAQOfFilm(@Path() String id,
      {@Path() final String apiKey = apiKey});

  @GET("Awards/{apiKey}/{id}")
  Future<FilmAwardDetails> getAwardsOfFilm(@Path() String id,
      {@Path() final String apiKey = apiKey});
}
