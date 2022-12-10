import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb/helper/functions/api_result.dart';
import 'package:imdb/helper/functions/network_exceptions.dart';
import 'package:imdb/repositories/different_calls_repo.dart';
import 'package:imdb/view_models/youtube_trailer/youtube_trailer_details.dart';
import 'package:imdb/views/bloc/cubit_result_state.dart';

class DifferentCallsCubit extends Cubit<ResultState<YoutubeTrailerDetails>> {
  final DifferentCallsRepo _differentCallsRepo;
  DifferentCallsCubit(this._differentCallsRepo) : super(const initial());
  static DifferentCallsCubit get(BuildContext context) =>
      BlocProvider.of(context);

  void getYouTubeTrailer({required String trailerId}) async {
    emit(const ResultState.loading());
    ApiResult<YoutubeTrailerDetails> result =
        await _differentCallsRepo.getYouTubeTrailer(trailerId);

    result.when(success: (YoutubeTrailerDetails data) {
      emit(ResultState.success(data));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(ResultState.error(networkExceptions));
    });
  }
}
