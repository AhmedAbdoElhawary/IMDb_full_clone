import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb/helper/resources/color_manager.dart';
import 'package:imdb/helper/resources/styles_manager.dart';
import 'package:imdb/helper/utility/constant.dart';


class GoldTitleOfMainCard extends StatelessWidget {
  final bool withoutVerticalPadding;
  final bool withoutSeeAll;

  final String title;
  final String subTitle;

  const GoldTitleOfMainCard(
      {Key? key,
      required this.title,
      this.subTitle = "",
      this.withoutSeeAll = false,
      this.withoutVerticalPadding = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsetsDirectional.only(
        start: horizontalPadding,
        end: horizontalPadding,
        top: 10.h,
        bottom: withoutVerticalPadding ? 0 : 10.h,
      ),
      child: Row(
        children: [
          Container(
            height: 23.h,
            width: 4.w,
            decoration: BoxDecoration(
                color: ColorManager.blackYellow,
                borderRadius: BorderRadius.circular(5)),
          ),
          const RSizedBox(width: 10),
          Expanded(
            child: subTitle.isEmpty
                ? _TitleOfCard(title: title)
                : Row(
                    children: [
                      _TitleOfCard(title: title),
                      const RSizedBox(width: 5),
                      Text(
                        subTitle,
                        style: getNormalStyle(
                            fontSize: 15, color: ColorManager.grey),
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
          ),
          if (!withoutSeeAll)
            GestureDetector(
              onTap: () {},
              child: Text("SEE ALL",
                  style: getMediumStyle(
                      fontSize: 15, color: ColorManager.darkBlue)),
            )
        ],
      ),
    );
  }
}

class _TitleOfCard extends StatelessWidget {
  const _TitleOfCard({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: 1,
      style: getMediumStyle(fontSize: 20),
      softWrap: true,
      overflow: TextOverflow.ellipsis,
    );
  }
}
