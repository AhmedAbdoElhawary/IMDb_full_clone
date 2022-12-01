import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb/core/resources/color_manager.dart';
import 'package:imdb/core/resources/styles_manager.dart';
import 'package:imdb/presentation/pages/home/widgets/film_card.dart';

class ActorBirthdayCard extends StatelessWidget {
  const ActorBirthdayCard({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenHeightOver3 = screenHeight / 2.7;
    double horizontalPadding = 10.w;
    double verticalPadding = 8.h;

    return Container(
      height: screenHeightOver3,
      width: 150.w,
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: _boxShadows(),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeightOver3 / 1.45,
              width: double.infinity,
              child: const StaticImage(),
            ),
            SizedBox(height: horizontalPadding),
            Padding(
              padding: REdgeInsetsDirectional.only(start: verticalPadding),
              child: Text("Ahmed Abdo",
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style:
                      getNormalStyle(fontSize: 15, color: ColorManager.black)),
            ),
            const Spacer(),
            Padding(
              padding: REdgeInsetsDirectional.only(start: verticalPadding),
              child: Text("21",
                  style: getNormalStyle(
                      fontSize: 12, color: ColorManager.black54)),
            ),
            SizedBox(height: horizontalPadding),
          ],
        ),
      ),
    );
  }
}

List<BoxShadow> _boxShadows() => [
      BoxShadow(
        color: ColorManager.grey.withOpacity(.2),
        spreadRadius: 0.7,
        blurRadius: 3,
        offset: const Offset(1, 3),
      ),
      BoxShadow(
        color: ColorManager.grey.withOpacity(.15),
        spreadRadius: 0.5,
        blurRadius: 1,
        offset: const Offset(-1, 0),
      ),
    ];
