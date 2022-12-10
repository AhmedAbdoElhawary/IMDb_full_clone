import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb/helper/functions/api_result.dart';
import 'package:imdb/helper/functions/network_exceptions.dart';
import 'package:imdb/repositories/personal_info_repo.dart';
import 'package:imdb/view_models/personal_award/personal_award_details.dart';
import 'package:imdb/view_models/personal_info/personal_info_details.dart';
import 'package:imdb/views/bloc/cubit_result_state.dart';

class PersonalInfoCubit extends Cubit<ResultState<dynamic>> {
  final PersonalInfoRepo _personalInfoRepo;
  PersonalInfoCubit(this._personalInfoRepo) : super(const initial());
  static PersonalInfoCubit get(BuildContext context) =>
      BlocProvider.of(context);
  void getPersonalAwards({required String personalId}) async {
    emit(const ResultState.loading());
    ApiResult<PersonalAwardDetails> result =
        await _personalInfoRepo.getPersonalAwards(personalId);

    result.when(success: (PersonalAwardDetails data) {
      emit(ResultState<PersonalAwardDetails>.success(data));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(ResultState.error(networkExceptions));
    });
  }

  void getPersonalInfo({required String personalId}) async {
    emit(const ResultState.loading());
    ApiResult<PersonalInfoDetails> result =
        await _personalInfoRepo.getPersonalInfo(personalId);

    result.when(success: (PersonalInfoDetails data) {
      emit(ResultState<PersonalInfoDetails>.success(data));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(ResultState.error(networkExceptions));
    });
  }
}
