import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb/helper/resources/color_manager.dart';
import 'package:imdb/helper/resources/styles_manager.dart';

class RoundedKeywordContainer extends StatelessWidget {
  final String text;
  const RoundedKeywordContainer({Key? key, this.text = "Action"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: ColorManager.grey, width: 1)),
      child: Center(
        child: Text(text, style: getNormalStyle(fontSize: 15)),
      ),
    );
  }
}
