import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb/helper/resources/color_manager.dart';
import 'package:imdb/helper/resources/styles_manager.dart';
import 'package:imdb/helper/utility/constant.dart';
import 'package:imdb/views/common_widgets/basic_film_and_sub_info_in_row.dart';
import 'package:imdb/views/common_widgets/suggestion_filtered_container.dart';

class FilmsFiltered extends StatelessWidget {
  const FilmsFiltered({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.veryLowOpacityGrey2,
      appBar: AppBar(
        toolbarHeight: 56.h,
        title: Text("Action", style: getMediumStyle(fontSize: 20)),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => index == 0
              ? const _FilteredWidgets()
              : const BasicFilmAndSubInfoInRow(),
          separatorBuilder: (context, index) => index == 0
              ? const SizedBox()
              : const Divider(color: ColorManager.grey, height: 1),
          itemCount: 50),
    );
  }
}

class _FilteredWidgets extends StatelessWidget {
  const _FilteredWidgets({Key? key}) : super(key: key);

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
                      Text("100 Results", style: getNormalStyle(fontSize: 15)),
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
