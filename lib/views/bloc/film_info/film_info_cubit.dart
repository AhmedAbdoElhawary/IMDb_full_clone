import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb/helper/functions/api_result.dart';
import 'package:imdb/helper/functions/network_exceptions.dart';
import 'package:imdb/repositories/film_info_repo.dart';
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

part 'film_info_state.dart';

class FilmInfoCubit extends Cubit<FilmInfoState> {
  final FilmInfoRepo _filmInfoRepo;
  FilmInfoCubit(this._filmInfoRepo) : super(Initial());

  static FilmInfoCubit get(BuildContext context) => BlocProvider.of(context);

  void getFilmInfo({required String filmId}) async {
    emit(Loading());
    ApiResult<FilmDetails> result = await _filmInfoRepo.getFilmInfo(filmId);

    result.when(success: (FilmDetails data) {
      emit(Loaded<FilmDetails>(data));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(Failed(networkExceptions));
    });
  }

  void getAwardsOfFilm({required String filmId}) async {
    emit(Loading());
    ApiResult<FilmAwardDetails> result =
        await _filmInfoRepo.getAwardsOfFilm(filmId);

    result.when(success: (FilmAwardDetails data) {
      emit(Loaded<FilmAwardDetails>(data));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(Failed(networkExceptions));
    });
  }

  void getFAQOfFilm({required String filmId}) async {
    emit(Loading());
    ApiResult<FAQDetails> result = await _filmInfoRepo.getFAQOfFilm(filmId);

    result.when(success: (FAQDetails data) {
      emit(Loaded<FAQDetails>(data));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(Failed(networkExceptions));
    });
  }

  void getFullCastOfFilm({required String filmId}) async {
    emit(Loading());
    ApiResult<FullCast> result = await _filmInfoRepo.getFullCastOfFilm(filmId);

    result.when(success: (FullCast data) {
      emit(Loaded<FullCast>(data));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(Failed(networkExceptions));
    });
  }

  void getFullImagesOfFilm({required String filmId}) async {
    emit(Loading());
    ApiResult<ImageDetails> result =
        await _filmInfoRepo.getFullImagesOfFilm(filmId);

    result.when(success: (ImageDetails data) {
      emit(Loaded<ImageDetails>(data));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(Failed(networkExceptions));
    });
  }

  void getMetacriticReviewsOfFilm({required String filmId}) async {
    emit(Loading());
    ApiResult<MetacriticReviewsDetails> result =
        await _filmInfoRepo.getMetacriticReviewsOfFilm(filmId);

    result.when(success: (MetacriticReviewsDetails data) {
      emit(Loaded<MetacriticReviewsDetails>(data));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(Failed(networkExceptions));
    });
  }

  void getPostersOfFilm({required String filmId}) async {
    emit(Loading());
    ApiResult<Posters> result = await _filmInfoRepo.getPostersOfFilm(filmId);

    result.when(success: (Posters data) {
      emit(Loaded<Posters>(data));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(Failed(networkExceptions));
    });
  }

  void getRatingOfFilm({required String filmId}) async {
    emit(Loading());
    ApiResult<RatingDetails> result =
        await _filmInfoRepo.getRatingOfFilm(filmId);

    result.when(success: (RatingDetails data) {
      emit(Loaded<RatingDetails>(data));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(Failed(networkExceptions));
    });
  }

  void getReviewsOfFilm({required String filmId}) async {
    emit(Loading());
    ApiResult<ReviewsDetails> result =
        await _filmInfoRepo.getReviewsOfFilm(filmId);

    result.when(success: (ReviewsDetails data) {
      emit(Loaded<ReviewsDetails>(data));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(Failed(networkExceptions));
    });
  }

  void getSeasonEpisodesOfSeries(
      {required String seriesId, required String seasonNumber}) async {
    emit(Loading());
    ApiResult<SeasonEpisode> result = await _filmInfoRepo
        .getSeasonEpisodesOfSeries(id: seriesId, seasonNumber: seasonNumber);

    result.when(success: (SeasonEpisode data) {
      emit(Loaded<SeasonEpisode>(data));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(Failed(networkExceptions));
    });
  }

  void getSubImagesOfFilm({required String filmId}) async {
    emit(Loading());
    ApiResult<ImageDetails> result =
        await _filmInfoRepo.getSubImagesOfFilm(filmId);

    result.when(success: (ImageDetails data) {
      emit(Loaded<ImageDetails>(data));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(Failed(networkExceptions));
    });
  }

  void getTrailerOfFilm({required String filmId}) async {
    emit(Loading());
    ApiResult<TrailerDetails> result =
        await _filmInfoRepo.getTrailerOfFilm(filmId);

    result.when(success: (TrailerDetails data) {
      emit(Loaded<TrailerDetails>(data));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(Failed(networkExceptions));
    });
  }

  void getUserRatingsOfFilm({required String filmId}) async {
    emit(Loading());
    ApiResult<UserRatingsDetails> result =
        await _filmInfoRepo.getUserRatingsOfFilm(filmId);

    result.when(success: (UserRatingsDetails data) {
      emit(Loaded<UserRatingsDetails>(data));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(Failed(networkExceptions));
    });
  }

  void getWikipediaPlotOfFilm({required String filmId}) async {
    emit(Loading());
    ApiResult<RatingDetails> result =
        await _filmInfoRepo.getWikipediaPlotOfFilm(filmId);

    result.when(success: (RatingDetails data) {
      emit(Loaded<RatingDetails>(data));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(Failed(networkExceptions));
    });
  }
}
