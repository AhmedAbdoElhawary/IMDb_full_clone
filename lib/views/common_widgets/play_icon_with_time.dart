import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb/helper/resources/color_manager.dart';
import 'package:imdb/helper/resources/styles_manager.dart';

class PlayIconWithTime extends StatelessWidget {
  const PlayIconWithTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.play_circle_outline,
          color: ColorManager.white,
          size: 30,
        ),
        const RSizedBox(width: 5),
        Text(
          "Trailer 0:29",
          style: getNormalStyle(fontSize: 15, color: ColorManager.white),
        )
      ],
    );
  }
}
