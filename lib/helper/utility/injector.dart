import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:imdb/helper/utility/app_prefs.dart';
import 'package:imdb/models/remote/box_office/box_office.dart';
import 'package:imdb/models/remote/different_calls_from/different_calls_from_api.dart';
import 'package:imdb/models/remote/film_info/film_info_api.dart';
import 'package:imdb/models/remote/most_popular_films/most_popular_films_api.dart';
import 'package:imdb/models/remote/new_films/new_films_api.dart';
import 'package:imdb/models/remote/personal_info/personal_info_api.dart';
import 'package:imdb/models/remote/top_250_films/top_250_films_api.dart';
import 'package:imdb/repositories/box_office_repo.dart';
import 'package:imdb/repositories/different_calls_repo.dart';
import 'package:imdb/repositories/film_info_repo.dart';
import 'package:imdb/repositories/most_popular_films_repo.dart';
import 'package:imdb/repositories/new_films_repo.dart';
import 'package:imdb/repositories/personal_info_repo.dart';
import 'package:imdb/repositories/top_250_films_repo.dart';
import 'package:imdb/views/bloc/box_office/box_office_cubit.dart';
import 'package:imdb/views/bloc/different_calls/different_calls_cubit.dart';
import 'package:imdb/views/bloc/film_info/film_info_cubit.dart';
import 'package:imdb/views/bloc/most_popular_films/most_popular_films_cubit.dart';
import 'package:imdb/views/bloc/new_films/new_films.dart';
import 'package:imdb/views/bloc/personal_info/personal_info_cubit.dart';
import 'package:imdb/views/bloc/top_250_films/top250_films_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final injector = GetIt.I;

Future<void> initializeDependencies() async {
  // shared prefs instance
  final sharedPrefs = await SharedPreferences.getInstance();

  // shared prefs instance
  injector.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // app prefs instance
  injector
      .registerLazySingleton<AppPreferences>(() => AppPreferences(injector()));

  /// Repositories
  injector
      .registerLazySingleton<BoxOfficeRepo>(() => BoxOfficeRepo(injector()));

  injector.registerLazySingleton<DifferentCallsRepo>(
      () => DifferentCallsRepo(injector()));

  injector.registerLazySingleton<PersonalInfoRepo>(
      () => PersonalInfoRepo(injector()));

  injector.registerLazySingleton<MostPopularFilmsRepo>(
      () => MostPopularFilmsRepo(injector()));

  injector.registerLazySingleton<NewFilmsRepo>(() => NewFilmsRepo(injector()));

  injector.registerLazySingleton<Top250FilmsRepo>(
      () => Top250FilmsRepo(injector()));

  injector.registerLazySingleton<FilmInfoRepo>(() => FilmInfoRepo(injector()));

  /// Apis
  injector.registerLazySingleton<BoxOfficeApi>(
      () => BoxOfficeApi(createAndSetupDio()));

  injector.registerLazySingleton<DifferentCallsFromApi>(
      () => DifferentCallsFromApi(createAndSetupDio()));

  injector.registerLazySingleton<MostPopularFilmsApi>(
      () => MostPopularFilmsApi(createAndSetupDio()));

  injector.registerLazySingleton<NewFilmsApi>(
      () => NewFilmsApi(createAndSetupDio()));

  injector.registerLazySingleton<Top250FilmsApi>(
      () => Top250FilmsApi(createAndSetupDio()));

  injector.registerLazySingleton<PersonalInfoApi>(
      () => PersonalInfoApi(createAndSetupDio()));

  injector.registerLazySingleton<FilmInfoApi>(
      () => FilmInfoApi(createAndSetupDio()));

  /// bloc
  injector.registerLazySingleton<Top250FilmsCubit>(
      () => Top250FilmsCubit(injector()));
  injector
      .registerLazySingleton<NewFilmsCubit>(() => NewFilmsCubit(injector()));

  injector.registerLazySingleton<MostPopularFilmsCubit>(
      () => MostPopularFilmsCubit(injector()));

  injector.registerLazySingleton<DifferentCallsCubit>(
      () => DifferentCallsCubit(injector()));

  injector.registerLazySingleton<PersonalInfoCubit>(
      () => PersonalInfoCubit(injector()));
  injector
      .registerLazySingleton<BoxOfficeCubit>(() => BoxOfficeCubit(injector()));

  injector
      .registerLazySingleton<FilmInfoCubit>(() => FilmInfoCubit(injector()));
}

Dio createAndSetupDio() {
  Dio dio = Dio();

  dio
    ..options.connectTimeout = 200 * 1000
    ..options.receiveTimeout = 200 * 1000;

  dio.interceptors.add(LogInterceptor(
    responseBody: true,
    error: true,
    requestHeader: false,
    responseHeader: false,
    request: true,
    requestBody: true,
  ));

  return dio;
}
