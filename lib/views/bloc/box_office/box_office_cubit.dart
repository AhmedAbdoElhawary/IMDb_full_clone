import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb/helper/functions/api_result.dart';
import 'package:imdb/helper/functions/network_exceptions.dart';
import 'package:imdb/repositories/box_office_repo.dart';
import 'package:imdb/view_models/box_office/box_office_details.dart';
import 'package:imdb/view_models/box_office_of_all_time/box_office_of_all_time_details.dart';
import 'package:imdb/views/bloc/cubit_result_state.dart';

class BoxOfficeCubit extends Cubit<ResultState<dynamic>> {
 final BoxOfficeRepo _boxOfficeRepo;
  BoxOfficeCubit(this._boxOfficeRepo) : super(const initial());
    static BoxOfficeCubit get(BuildContext context) =>
      BlocProvider.of(context);
  void getBoxOffice() async {
    emit(const ResultState.loading());
    ApiResult<BoxOfficeDetails> result =
        await _boxOfficeRepo.getBoxOffice();

    result.when(success: (BoxOfficeDetails data) {
      emit(ResultState.success(data));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(ResultState.error(networkExceptions));
    });
  }

    void getBoxOfficeAllTime() async {
    emit(const ResultState.loading());
    ApiResult<BoxOfficeOfAllTimeDetails> result =
        await _boxOfficeRepo.getBoxOfficeAllTime();

    result.when(success: (BoxOfficeOfAllTimeDetails data) {
      emit(ResultState.success(data));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(ResultState.error(networkExceptions));
    });
  }
}
