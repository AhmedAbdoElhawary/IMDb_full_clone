import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb/helper/functions/network_exceptions.dart';
import 'package:imdb/helper/resources/color_manager.dart';
import 'package:imdb/helper/resources/styles_manager.dart';
import 'package:imdb/helper/utility/constant.dart';
import 'package:imdb/view_models/in_theaters/new_film_details.dart';
import 'package:imdb/view_models/in_theaters/new_fim_items.dart';
import 'package:imdb/views/bloc/cubit_result_state.dart';
import 'package:imdb/views/bloc/new_films/new_films.dart';
import 'package:imdb/views/common_widgets/custom_circulars_progress.dart';
import 'package:imdb/views/common_widgets/film_sub_info_in_row.dart';
import 'package:imdb/views/common_widgets/suggestion_filtered_container.dart';

class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 56.h,
        title: Text("Coming soon", style: getMediumStyle(fontSize: 22)),
      ),
      body: Center(
        child: BlocBuilder<NewFilmsCubit, ResultState<NewFilmDetails>>(
          bloc: NewFilmsCubit.get(context)..getComingSoon(),
          buildWhen: (previous, current) => previous != current,
          builder: (context, ResultState<NewFilmDetails> state) {
            return state.when(
              initial: () => const CustomCircularProgress(),
              loading: () => const CustomCircularProgress(),
              success: (NewFilmDetails data) =>
                  FilmsFiltered(newFilmDetails: data),
              error: (e) {
                return Text(NetworkExceptions.getErrorMessage(e));
              },
            );
          },
        ),
      ),
    );
  }
}

class FilmsFiltered extends StatelessWidget {
  final NewFilmDetails newFilmDetails;
  const FilmsFiltered({super.key,required this.newFilmDetails});

  @override
  Widget build(BuildContext context) {
    int lengthOfItem = newFilmDetails.items?.length ?? 0;
    return ListView.separated(
        itemBuilder: (context, index) {
          if (index == 0) {
            return _FilteredWidgets(lengthOfItem: lengthOfItem);
          } else {
            NewFilmItems? newFilmItems = newFilmDetails.items?[index - 1];
            return FilmSubInfoInRow(
              id: newFilmItems?.id ?? "",
              imDbRating: newFilmItems?.imDbRating ?? "",
              image: newFilmItems?.image ?? "",
              title: newFilmItems?.title ?? "",
              year: newFilmItems?.year ?? "",
              releaseDate: newFilmItems?.releaseState ?? "",
              metacriticRating: newFilmItems?.metacriticRating ?? "",
            );
          }
        },
        separatorBuilder: (context, index) => index == 0
            ? const SizedBox()
            : const Divider(color: ColorManager.grey, height: 1),
        itemCount: lengthOfItem + 1);
  }
}

class _FilteredWidgets extends StatelessWidget {
  final int lengthOfItem;

  const _FilteredWidgets({Key? key, required this.lengthOfItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(top: 10),
      child: Column(
        children: [
          SizedBox(
            height: 37.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              children: const [
                RSizedBox(width: horizontalPadding),
                SuggestionFilteredContainer(),
                RSizedBox(width: horizontalPadding),
                SuggestionFilteredContainer(),
                RSizedBox(width: horizontalPadding),
                SuggestionFilteredContainer(),
                RSizedBox(width: horizontalPadding),
              ],
            ),
          ),
          Padding(
            padding: REdgeInsets.symmetric(vertical: 10),
            child: const Divider(color: ColorManager.grey),
          ),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 25),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("$lengthOfItem Results",
                          style: getNormalStyle(fontSize: 15)),
                      Text("Sorted by popularity",
                          style: getNormalStyle(
                              fontSize: 13, color: ColorManager.black54)),
                    ],
                  ),
                ),
                const Icon(Icons.sort, color: ColorManager.black54),
              ],
            ),
          ),
          const RSizedBox(height: 10),
          const Divider(color: ColorManager.grey, thickness: 1.8, height: 1),
        ],
      ),
    );
  }
}
