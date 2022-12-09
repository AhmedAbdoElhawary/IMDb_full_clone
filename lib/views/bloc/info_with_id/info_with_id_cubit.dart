import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb/helper/functions/api_result.dart';
import 'package:imdb/helper/functions/network_exceptions.dart';
import 'package:imdb/repositories/info_with_id_repo.dart';
import 'package:imdb/view_models/personal_award/personal_award_details.dart';
import 'package:imdb/view_models/personal_info/personal_info_details.dart';
import 'package:imdb/view_models/youtube_trailer/youtube_trailer_details.dart';
import 'package:imdb/views/bloc/cubit_result_state.dart';

class InfoWithIdCubit extends Cubit<ResultState<dynamic>> {
  final InfoWithIdRepo _infoWithIdRepo;
  InfoWithIdCubit(this._infoWithIdRepo) : super(const initial());
  static InfoWithIdCubit get(BuildContext context) => BlocProvider.of(context);
  void getPersonalAwards({required String personalId}) async {
    emit(const ResultState.loading());
    ApiResult<PersonalAwardDetails> result =
        await _infoWithIdRepo.getPersonalAwards(personalId);

    result.when(success: (PersonalAwardDetails data) {
      emit(ResultState<PersonalAwardDetails>.success(data));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(ResultState.error(networkExceptions));
    });
  }

  void getPersonalInfo({required String personalId}) async {
    emit(const ResultState.loading());
    ApiResult<PersonalInfoDetails> result =
        await _infoWithIdRepo.getPersonalInfo(personalId);

    result.when(success: (PersonalInfoDetails data) {
      emit(ResultState<PersonalInfoDetails>.success(data));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(ResultState.error(networkExceptions));
    });
  }

  void getYouTubeTrailer({required String trailerId}) async {
    emit(const ResultState.loading());
    ApiResult<YoutubeTrailerDetails> result =
        await _infoWithIdRepo.getYouTubeTrailer(trailerId);

    result.when(success: (YoutubeTrailerDetails data) {
      emit(ResultState<YoutubeTrailerDetails>.success(data));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(ResultState.error(networkExceptions));
    });
  }
}
