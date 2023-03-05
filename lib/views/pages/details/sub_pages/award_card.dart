import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb/helper/resources/color_manager.dart';
import 'package:imdb/helper/resources/styles_manager.dart';
import 'package:imdb/helper/utility/constant.dart';
import 'package:imdb/views/common_widgets/floating_container.dart';
import 'package:imdb/views/common_widgets/gold_title_of_main_card.dart';

class AwardsCard extends StatelessWidget {
  const AwardsCard({Key? key, required this.awards}) : super(key: key);
  final String awards;
  @override
  Widget build(BuildContext context) {
    List<String> firstList = awards.split(" | ");
    String topFilm = firstList.isNotEmpty ? firstList[0] : "";
    List<String> secondList =
        firstList.length > 1 ? firstList[1].split(", ") : [];
    return FloatingContainer(
      height: -1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const GoldTitleOfMainCard(title: "Awards"),
          const RSizedBox(height: 10),
          if (topFilm.isNotEmpty)
            Padding(
              padding: REdgeInsets.symmetric(
                  horizontal: horizontalPadding, vertical: 20),
              child: Text(topFilm, style: getNormalStyle(fontSize: 18)),
            ),
          if (secondList.isNotEmpty) ...[
            Padding(
              padding: REdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (secondList[0].isNotEmpty)
                    Text(secondList[0], style: getNormalStyle(fontSize: 18)),
                  if (secondList.length > 1 && secondList[1].isNotEmpty)
                    Text(secondList[1],
                        style: getNormalStyle(
                            fontSize: 16, color: ColorManager.grey)),
                ],
              ),
            ),
            const RSizedBox(height: 15),
          ],
        ],
      ),
    );
  }
}
