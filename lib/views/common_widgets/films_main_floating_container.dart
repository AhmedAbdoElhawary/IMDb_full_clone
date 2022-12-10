import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb/helper/resources/color_manager.dart';
import 'package:imdb/helper/resources/styles_manager.dart';
import 'package:imdb/helper/utility/constant.dart';
import 'package:imdb/view_models/in_theaters/new_fim_items.dart';
import 'package:imdb/views/common_widgets/floating_container.dart';
import 'package:imdb/views/common_widgets/gold_title_of_main_card.dart';
import 'package:imdb/views/common_widgets/suggestion_filtered_container.dart';
import 'package:imdb/views/pages/home/widgets/film_card.dart';

class FilmsMainCard extends StatelessWidget {
  final String titleOfContainer;
  const FilmsMainCard(this.titleOfContainer,
      {super.key, required this.filmItems});
  final List<NewFilmItems>? filmItems;

  @override
  Widget build(BuildContext context) {
    int length = filmItems?.length ?? 0;
    return FloatingContainer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GoldTitleOfMainCard(title: titleOfContainer),
          Padding(
            padding: REdgeInsetsDirectional.only(
                bottom: verticalPadding, start: verticalPadding),
            child: Text(
              "This week's top TV and movies",
              style: getNormalStyle(fontSize: 15, color: ColorManager.grey),
            ),
          ),
          SizedBox(
            height: 35.h,
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
          Flexible(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  NewFilmItems? item = filmItems?[index];
                  return Padding(
                    padding: REdgeInsetsDirectional.only(
                        start: index == 0 ? horizontalPadding : 8,
                        end: index == 9 ? horizontalPadding : 0),
                    child: Center(
                        child: FilmCard(
                      filmId: item?.id ?? "",
                      imageUrl: item?.image ?? "",
                      imdbRating: item?.imDbRating ?? "",
                      title: item?.title ?? "",
                      time: item?.runtimeStr ?? "",
                      year: item?.year ?? "",
                    )),
                  );
                },
                itemCount: length >= 7 ? 7 : length),
          ),
          const RSizedBox(height: 15),
        ],
      ),
    );
  }
}
