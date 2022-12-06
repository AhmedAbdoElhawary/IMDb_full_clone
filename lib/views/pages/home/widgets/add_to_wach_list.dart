import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb/helper/resources/color_manager.dart';

class AddToWatchList extends StatefulWidget {
  final bool makeItSmaller;
  const AddToWatchList({this.makeItSmaller = false, Key? key})
      : super(key: key);

  @override
  State<AddToWatchList> createState() => _AddToWatchListState();
}

class _AddToWatchListState extends State<AddToWatchList> {
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => check = !check);
      },
      child: Container(
          height: widget.makeItSmaller ? 40.h : 55.h,
          width: widget.makeItSmaller ? 30.w : 40.w,
          color: check ? ColorManager.blackYellow : ColorManager.black54,
          child: check
              ? const Icon(Icons.check, color: ColorManager.black)
              : const Icon(Icons.add, color: ColorManager.white)),
    );
  }
}
