import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb/helper/resources/color_manager.dart';
import 'package:imdb/helper/resources/styles_manager.dart';
import 'package:imdb/helper/routes/route_app.dart';
import 'package:imdb/views/common_widgets/network_image_display.dart';
import 'package:imdb/views/pages/details/actor_info_page.dart';
import 'package:imdb/views/pages/home/widgets/film_card.dart';

class ActorCard extends StatelessWidget {
  final String actorId;
  final String image;
  final String title;
  final String subTitle;

  const ActorCard({
    super.key,
    this.actorId = "",
    this.image = imageUrl,
    this.subTitle = "",
    this.title = "",
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenHeightOver3 = screenHeight / 2.7;
    double horizontalPadding = 10.w;
    double verticalPadding = 8.h;

    return GestureDetector(
      onTap: () {
        Go(context).to(ActorInfoPage(actorId: actorId));
      },
      child: Container(
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
                child: NetworkImageDisplay(image, fit: BoxFit.cover),
              ),
              SizedBox(height: horizontalPadding),
              Padding(
                padding: REdgeInsetsDirectional.only(start: verticalPadding),
                child: Text(title,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: getNormalStyle(
                        fontSize: 18, color: ColorManager.black)),
              ),
              const Spacer(),
              Padding(
                padding: REdgeInsetsDirectional.only(start: verticalPadding),
                child: Text(subTitle,
                    style: getNormalStyle(
                        fontSize: 15, color: ColorManager.black54)),
              ),
              SizedBox(height: horizontalPadding),
            ],
          ),
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
