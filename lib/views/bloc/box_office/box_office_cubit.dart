import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb/helper/functions/api_result.dart';
import 'package:imdb/helper/functions/network_exceptions.dart';
import 'package:imdb/repositories/box_office_repo.dart';
import 'package:imdb/view_models/box_office/box_office_details.dart';
import 'package:imdb/view_models/box_office_of_all_time/box_office_of_all_time_details.dart';

part 'cubit_result_state.dart';

class BoxOfficeCubit extends Cubit<BoxOfficeState> {
 final BoxOfficeRepo _boxOfficeRepo;
  BoxOfficeCubit(this._boxOfficeRepo) : super( CubitInitial());
    static BoxOfficeCubit get(BuildContext context) =>
      BlocProvider.of(context);

  void getBoxOffice() async {
    emit( CubitLoading());
    ApiResult<BoxOfficeDetails> result =
        await _boxOfficeRepo.getBoxOffice();

    result.when(success: (BoxOfficeDetails data) {
      emit(CubitBoxOfficeLoaded(data));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(CubitFailed(networkExceptions));
    });
  }

    void getBoxOfficeAllTime() async {
    emit(CubitLoading());
    ApiResult<BoxOfficeOfAllTimeDetails> result =
        await _boxOfficeRepo.getBoxOfficeAllTime();

    result.when(success: (BoxOfficeOfAllTimeDetails data) {
      emit(CubitBoxOfficeAllTimeLoaded(data));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(CubitFailed(networkExceptions));
    });
  }
}
