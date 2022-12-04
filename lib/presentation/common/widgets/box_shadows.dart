import 'package:flutter/material.dart';
import 'package:imdb/core/resources/color_manager.dart';

List<BoxShadow> customBoxShadows() => [
      BoxShadow(
        color: ColorManager.grey.withOpacity(.3),
        spreadRadius: 2,
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
