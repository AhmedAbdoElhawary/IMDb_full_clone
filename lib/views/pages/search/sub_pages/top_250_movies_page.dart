import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb/helper/functions/network_exceptions.dart';
import 'package:imdb/helper/resources/styles_manager.dart';
import 'package:imdb/view_models/film/film_details.dart';
import 'package:imdb/views/bloc/cubit_result_state.dart';
import 'package:imdb/views/bloc/top_250_films/top250_films_cubit.dart';
import 'package:imdb/views/common_widgets/custom_circulars_progress.dart';
import 'package:imdb/views/pages/films_filtered/films_filtered_page.dart';

class Top250MoviesPage extends StatelessWidget {
  const Top250MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 56.h,
          title: Text("Top 250 TV movies", style: getMediumStyle(fontSize: 20)),
        ),
        body: Center(
          child: BlocBuilder<Top250FilmsCubit, ResultState<FilmDetails>>(
            bloc: Top250FilmsCubit.get(context)..getTop250Movies(),
            buildWhen: (previous, current) => previous != current,
            builder: (context, ResultState<FilmDetails> state) {
              return state.when(
                initial: () => const CustomCircularProgress(),
                loading: () => const CustomCircularProgress(),
                success: (FilmDetails data) =>  FilmsFiltered(filmsDetails: data),
                error: (e) {
                  return Text(NetworkExceptions.getErrorMessage(e));
                },
              );
            },
          ),
        ));
  }
}