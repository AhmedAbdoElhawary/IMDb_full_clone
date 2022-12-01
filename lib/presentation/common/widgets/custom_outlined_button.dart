import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb/core/resources/color_manager.dart';

class CustomOutlinedButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final Color roundedColor;
  const CustomOutlinedButton(
      {Key? key,
      required this.child,
      required this.onPressed,
      this.roundedColor = ColorManager.black54})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: outlinedStyle(),
      onPressed: onPressed,
      child: child,
    );
  }

  ButtonStyle outlinedStyle() {
    return OutlinedButton.styleFrom(
      minimumSize: Size(double.infinity, 40.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
      side: BorderSide(width: 1, color: roundedColor),
    );
  }
}
