import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb/helper/utility/injector.dart';
import 'package:imdb/views/bloc/box_office/box_office_cubit.dart';
import 'package:imdb/views/bloc/different_calls/different_calls_cubit.dart';
import 'package:imdb/views/bloc/film_info/film_info_cubit.dart';
import 'package:imdb/views/bloc/most_popular_films/most_popular_films_cubit.dart';
import 'package:imdb/views/bloc/new_films/new_films.dart';
import 'package:imdb/views/bloc/personal_info/personal_info_cubit.dart';
import 'package:imdb/views/bloc/top_250_films/top250_films_cubit.dart';

class MultiBlocs extends StatelessWidget {
  final Widget materialApp;

  const MultiBlocs(this.materialApp, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<Top250FilmsCubit>(
        create: (context) => injector<Top250FilmsCubit>(),
      ),
      BlocProvider<MostPopularFilmsCubit>(
        create: (context) => injector<MostPopularFilmsCubit>(),
      ),
      BlocProvider<NewFilmsCubit>(
        create: (context) => injector<NewFilmsCubit>(),
      ),
      BlocProvider<BoxOfficeCubit>(
        create: (context) => injector<BoxOfficeCubit>(),
      ),
      BlocProvider<DifferentCallsCubit>(
        create: (context) => injector<DifferentCallsCubit>(),
      ),
      BlocProvider<FilmInfoCubit>(
        create: (context) => injector<FilmInfoCubit>(),
      ),
      BlocProvider<PersonalInfoCubit>(
        create: (context) => injector<PersonalInfoCubit>(),
      ),
    ], child: materialApp);
  }
}
