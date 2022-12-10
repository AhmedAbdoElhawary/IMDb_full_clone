import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb/helper/resources/color_manager.dart';
import 'package:imdb/helper/resources/styles_manager.dart';
import 'package:imdb/helper/utility/constant.dart';
import 'package:imdb/view_models/film/film_sub_details/film_sub_details.dart';
import 'package:imdb/view_models/film/film_sub_details/film_sub_items.dart';
import 'package:imdb/views/common_widgets/film_sub_info_in_row.dart';
import 'package:imdb/views/common_widgets/suggestion_filtered_container.dart';

class FilmsFiltered extends StatelessWidget {
  final FilmSubDetails? filmsDetails;
  const FilmsFiltered({super.key, this.filmsDetails});

  @override
  Widget build(BuildContext context) {
    int lengthOfItem = filmsDetails?.items?.length ?? 0;
    return ListView.separated(
        itemBuilder: (context, index) {
          FilmSubItems? filmItems = filmsDetails?.items?[index==0?index:index - 1];

          return index == 0
              ? _FilteredWidgets(lengthOfItem: lengthOfItem)
              : FilmSubInfoInRow(
                  id: filmItems?.id ?? "",
                  imDbRating: filmItems?.imDbRating ?? "",
                  imageUrl: filmItems?.image ?? "",
                  title: filmItems?.title ?? "",
                  year: filmItems?.year ?? "",
                );
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
