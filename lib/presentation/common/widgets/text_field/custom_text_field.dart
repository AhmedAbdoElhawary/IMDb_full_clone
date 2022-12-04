import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb/core/resources/color_manager.dart';
import 'package:imdb/core/resources/styles_manager.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool enable;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hint,
    this.enable=true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      controller: controller,
      cursorColor: ColorManager.black,
      enabled: enable,
      cursorHeight: 25,
      style: getNormalStyle(color: Theme.of(context).focusColor, fontSize: 20),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: getNormalStyle(color: ColorManager.black, fontSize: 19),
        fillColor: ColorManager.transparent,
        filled: true,
        border: InputBorder.none,
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
        contentPadding: REdgeInsets.all(0),
      ),
    );
  }
}
