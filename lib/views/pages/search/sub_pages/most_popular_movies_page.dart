import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb/helper/functions/network_exceptions.dart';
import 'package:imdb/helper/resources/styles_manager.dart';
import 'package:imdb/view_models/film/film_sub_details/film_sub_details.dart';
import 'package:imdb/views/bloc/cubit_result_state.dart';
import 'package:imdb/views/bloc/most_popular_films/most_popular_films_cubit.dart';
import 'package:imdb/views/common_widgets/custom_circulars_progress.dart';
import 'package:imdb/views/pages/films_filtered/films_filtered_page.dart';

class MostPopularMoviesPage extends StatelessWidget {
  const MostPopularMoviesPage({super.key, this.isThatMovie = true});
  final bool isThatMovie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 56.h,
        title: Text(
            isThatMovie ? "Most Popular Movies" : "Most Popular TV Series",
            style: getMediumStyle(fontSize: 22)),
      ),
      body: Center(
        child: isThatMovie
            ? BlocBuilder<MostPopularFilmsCubit, ResultState<FilmSubDetails>>(
                bloc: MostPopularFilmsCubit.get(context)
                  ..getMostPopularMovies(),
                buildWhen: (previous, current) => previous != current,
                builder: builder,
              )
            : BlocBuilder<MostPopularFilmsCubit, ResultState<FilmSubDetails>>(
                bloc: MostPopularFilmsCubit.get(context)..getMostPopularTVs(),
                buildWhen: (previous, current) => previous != current,
                builder: builder,
              ),
      ),
    );
  }
}

Widget builder(context, ResultState<FilmSubDetails> state) {
  return state.when(
    initial: () => const CustomCircularProgress(),
    loading: () => const CustomCircularProgress(),
    success: (FilmSubDetails data) => FilmsFiltered(filmsDetails: data),
    error: (e) {
      return Text(NetworkExceptions.getErrorMessage(e));
    },
  );
}
