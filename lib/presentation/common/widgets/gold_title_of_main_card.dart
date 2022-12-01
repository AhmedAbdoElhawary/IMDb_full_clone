import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb/core/resources/color_manager.dart';
import 'package:imdb/core/resources/styles_manager.dart';

const double _horizontalPadding = 15;

class GoldTitleOfMainCard extends StatelessWidget {
  final bool withoutVerticalPadding;
  final bool withoutSeeAll;

  final String title;
  const GoldTitleOfMainCard(
      {Key? key,
      required this.title,
      this.withoutSeeAll = false,
      this.withoutVerticalPadding = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsetsDirectional.only(
        start: _horizontalPadding,
        end: _horizontalPadding,
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
            child: Text(
              title,
              style: getMediumStyle(fontSize: 20),
              softWrap: true,
              overflow: TextOverflow.ellipsis,
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
