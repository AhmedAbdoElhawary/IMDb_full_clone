import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb/core/resources/color_manager.dart';
import 'package:imdb/core/resources/styles_manager.dart';
import 'package:imdb/presentation/pages/search/widgets/search_text_field.dart';

class MobilePhoneTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  const MobilePhoneTextField(
      {required this.controller, required this.hint, Key? key})
      : super(key: key);

  @override
  State<MobilePhoneTextField> createState() => _MobilePhoneTextFieldState();
}

class _MobilePhoneTextFieldState extends State<MobilePhoneTextField> {
  @override
  Widget build(BuildContext context) {
    return RSizedBox(
      width: double.infinity,
      child: SearchTextField(
        controller: widget.controller,
        hint: widget.hint,
      ),
    );
  }

  Padding prefixIcon() {
    return Padding(
      padding: REdgeInsets.only(bottom: 1.0, right: 5, left: 15),
      child: Text("+20",
          style: getMediumStyle(color: ColorManager.black, fontSize: 16)),
    );
  }
}
