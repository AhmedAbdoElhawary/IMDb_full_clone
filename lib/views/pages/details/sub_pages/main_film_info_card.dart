import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb/helper/resources/color_manager.dart';
import 'package:imdb/helper/resources/styles_manager.dart';
import 'package:imdb/helper/utility/constant.dart';
import 'package:imdb/view_models/personal_info/personal_info_details.dart';
import 'package:imdb/views/common_widgets/floating_container.dart';
import 'package:imdb/views/common_widgets/network_image_display.dart';

class MainActorInfoCard extends StatelessWidget {
  const MainActorInfoCard({Key? key, required this.actorDetails})
      : super(key: key);
  final PersonalInfoDetails actorDetails;
  @override
  Widget build(BuildContext context) {

    return FloatingContainer(
      height: -1,
      child: Padding(
        padding: REdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _FilmTitleAndSubNumbersInfo(actorDetails),
            _PosterAndSubInfo(actorDetails),
            const RSizedBox(height: 5),
            const Divider(color: ColorManager.grey),
          ],
        ),
      ),
    );
  }
}

class _FilmTitleAndSubNumbersInfo extends StatelessWidget {
  const _FilmTitleAndSubNumbersInfo(this.actorDetails, {Key? key})
      : super(key: key);
  final PersonalInfoDetails actorDetails;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: REdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Text(
          actorDetails.name,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          style: getNormalStyle(fontSize: 35),
        ),
      ),
      Padding(
        padding:
            REdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 5),
        child: Text(
          actorDetails.role,
          style: getNormalStyle(fontSize: 15, color: ColorManager.grey),
        ),
      ),
    ]);
  }
}

class _PosterAndSubInfo extends StatelessWidget {
  const _PosterAndSubInfo(this.actorDetails);
  final PersonalInfoDetails actorDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          REdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 108.w,
            height: 160.h,
            child: NetworkImageDisplay(actorDetails.image, fit: BoxFit.cover),
          ),
          const RSizedBox(width: horizontalPadding),
          Flexible(
            child: Text(
              actorDetails.summary,
              softWrap: true,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: getNormalStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
