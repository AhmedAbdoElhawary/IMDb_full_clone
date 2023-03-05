import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb/helper/functions/api_result.dart';
import 'package:imdb/helper/functions/network_exceptions.dart';
import 'package:imdb/repositories/personal_info_repo.dart';
import 'package:imdb/view_models/personal_award/personal_award_details.dart';
import 'package:imdb/view_models/personal_info/personal_info_details.dart';

part 'personal_info_state.dart';

class PersonalInfoCubit extends Cubit<PersonalInfoState> {
  final PersonalInfoRepo _personalInfoRepo;
  PersonalInfoCubit(this._personalInfoRepo) : super(Initial());

  static PersonalInfoCubit get(BuildContext context) =>
      BlocProvider.of<PersonalInfoCubit>(context);

  void getPersonalInfo({required String personalId}) async {
    emit(Loading());
    ApiResult<PersonalInfoDetails> result =
        await _personalInfoRepo.getPersonalInfo(personalId);

    result.when(success: (PersonalInfoDetails data) {
      emit(Success<PersonalInfoDetails>(data));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(PersonalFailed(networkExceptions));
    });
  }

  void getPersonalAwards({required String personalId}) async {
    emit(Loading());
    ApiResult<PersonalAwardDetails> result =
        await _personalInfoRepo.getPersonalAwards(personalId);

    result.when(success: (PersonalAwardDetails data) {
      emit(Success<PersonalAwardDetails>(data));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(PersonalFailed(networkExceptions));
    });
  }
}
