import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb/helper/functions/api_result.dart';
import 'package:imdb/helper/functions/network_exceptions.dart';
import 'package:imdb/repositories/top_250_films_repo.dart';
import 'package:imdb/view_models/film/film_details.dart';
import 'package:imdb/views/bloc/cubit_result_state.dart';

class Top250FilmsCubit extends Cubit<ResultState<FilmDetails>> {
  final Top250FilmsRepo _top250filmsRepo;
  Top250FilmsCubit(this._top250filmsRepo) : super(const initial());
    static Top250FilmsCubit get(BuildContext context) =>
      BlocProvider.of(context);
  void getTop250Movies() async {
    emit(const ResultState.loading());
    ApiResult<FilmDetails> result =
        await _top250filmsRepo.getTop250Movies();

    result.when(success: (FilmDetails userData) {
      emit(ResultState.success(userData));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(ResultState.error(networkExceptions));
    });
  }

    void getTop250TVs() async {
    emit(const ResultState.loading());
    ApiResult<FilmDetails> result =
        await _top250filmsRepo.getTop250TVs();

    result.when(success: (FilmDetails userData) {
      emit(ResultState.success(userData));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(ResultState.error(networkExceptions));
    });
  }
}
