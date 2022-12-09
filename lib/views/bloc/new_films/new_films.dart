import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb/helper/functions/api_result.dart';
import 'package:imdb/helper/functions/network_exceptions.dart';
import 'package:imdb/repositories/new_films_repo.dart';
import 'package:imdb/view_models/in_theaters/new_film_details.dart';
import 'package:imdb/views/bloc/cubit_result_state.dart';

class NewFilmsCubit extends Cubit<ResultState<dynamic>> {
  final NewFilmsRepo _newFilmsRepo;
  NewFilmsCubit(this._newFilmsRepo) : super(const initial());
  static NewFilmsCubit get(BuildContext context) => BlocProvider.of(context);
  void getComingSoon() async {
    emit(const ResultState.loading());
    ApiResult<NewFilmDetails> result = await _newFilmsRepo.getComingSoon();

    result.when(success: (NewFilmDetails data) {
      emit(ResultState<NewFilmDetails>.success(data));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(ResultState.error(networkExceptions));
    });
  }

  void getInTheaters() async {
    emit(const ResultState.loading());
    ApiResult<NewFilmDetails> result = await _newFilmsRepo.getInTheaters();

    result.when(success: (NewFilmDetails data) {
      emit(ResultState<NewFilmDetails>.success(data));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(ResultState.error(networkExceptions));
    });
  }

}
