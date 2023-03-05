import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb/helper/resources/color_manager.dart';

class FloatingContainer extends StatelessWidget {
  final double? height;
  final Widget child;
  const FloatingContainer(
      {super.key, this.height, required this.child});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: height == -1 ? null : height ?? screenHeight / 1.45,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorManager.white,
        boxShadow: [_cardBoxShadow()],
      ),
      child: child,
    );
  }
}

BoxShadow _cardBoxShadow() {
  return BoxShadow(
    color: ColorManager.grey.withOpacity(.55),
    spreadRadius: 0.5,
    blurRadius: 3,
    offset: const Offset(0, 3),
  );
}
