import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb/core/resources/color_manager.dart';
import 'package:imdb/core/resources/styles_manager.dart';

class SuggestionFilteredContainer extends StatefulWidget {
  const SuggestionFilteredContainer({Key? key}) : super(key: key);

  @override
  State<SuggestionFilteredContainer> createState() =>
      _SuggestionFilteredContainerState();
}

class _SuggestionFilteredContainerState
    extends State<SuggestionFilteredContainer> {
  String selectedText = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: ColorManager.black54, width: 0.5)),
      child: Center(
        child: selectedText.isNotEmpty
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const RSizedBox(width: 10),
                  Text(selectedText, style: getNormalStyle(fontSize: 15)),
                  const RSizedBox(width: 5),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedText = "";
                        });
                      },
                      child: Container(
                          padding: REdgeInsets.all(1.5),
                          decoration: const BoxDecoration(
                              color: ColorManager.black87,
                              shape: BoxShape.circle),
                          child: const Icon(Icons.close,
                              size: 15, color: ColorManager.white))),
                  const RSizedBox(width: 10),
                ],
              )
            : completeSuggestions(),
      ),
    );
  }

  Row completeSuggestions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const RSizedBox(width: 10),
        GestureDetector(
          onTap: () {
            setState(() {
              selectedText = "Movie";
            });
          },
          child: Text(
            "Movie",
            style: getNormalStyle(fontSize: 15),
          ),
        ),
        const RSizedBox(width: 10),
        Container(
            height: double.infinity, width: 1, color: ColorManager.black54),
        const RSizedBox(width: 10),
        GestureDetector(
          onTap: () {
            setState(() {
              selectedText = "TV Series";
            });
          },
          child: Text(
            "TV Series",
            style: getNormalStyle(fontSize: 15),
          ),
        ),
        const RSizedBox(width: 10),
        Container(
            height: double.infinity, width: 1, color: ColorManager.black54),
        const RSizedBox(width: 10),
        GestureDetector(
          onTap: () {
            setState(() {
              selectedText = "TV Mini-Series";
            });
          },
          child: Text(
            "TV Mini-Series",
            style: getNormalStyle(fontSize: 15),
          ),
        ),
        const RSizedBox(width: 10),
        Container(
            height: double.infinity, width: 1, color: ColorManager.black54),
        const RSizedBox(width: 10),
        GestureDetector(
          onTap: () {},
          child: Text(
            "More...",
            style: getNormalStyle(fontSize: 15),
          ),
        ),
        const RSizedBox(width: 10),
      ],
    );
  }
}
