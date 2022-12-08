import 'package:bloc/bloc.dart';
import 'package:imdb/helper/functions/api_result.dart';
import 'package:imdb/helper/functions/network_exceptions.dart';
import 'package:imdb/repositories/most_popular_films_repo.dart';
import 'package:imdb/view_models/film/film_details.dart';
import 'package:imdb/views/bloc/cubit_result_state.dart';

class MostPopularFilmsCubit extends Cubit<ResultState<FilmDetails>> {
  final MostPopularFilmsRepo _mostPopularFilmsRepo;
  MostPopularFilmsCubit(this._mostPopularFilmsRepo) : super(const initial());

  void getMostPopularMovies() async {
    emit(const ResultState.loading());
    ApiResult<FilmDetails> result =
        await _mostPopularFilmsRepo.getMostPopularMovies();

    result.when(success: (FilmDetails userData) {
      emit(ResultState.success(userData));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(ResultState.error(networkExceptions));
    });
  }

    void getMostPopularTVs() async {
    emit(const ResultState.loading());
    ApiResult<FilmDetails> result =
        await _mostPopularFilmsRepo.getMostPopularTVs();

    result.when(success: (FilmDetails userData) {
      emit(ResultState.success(userData));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(ResultState.error(networkExceptions));
    });
  }
}
