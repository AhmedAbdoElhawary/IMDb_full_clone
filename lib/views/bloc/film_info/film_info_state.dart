
part of 'film_info_cubit.dart';


abstract class FilmInfoState {}

class Initial extends FilmInfoState {}

class Loading extends FilmInfoState {}

class Loaded<T> extends FilmInfoState {
    final T details;
  Loaded(this.details);
}

class Failed extends FilmInfoState {
  NetworkExceptions error;
  Failed(this.error);
}
