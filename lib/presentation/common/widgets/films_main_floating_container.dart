
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb/core/resources/color_manager.dart';
import 'package:imdb/core/resources/styles_manager.dart';
import 'package:imdb/presentation/common/widgets/floating_container.dart';
import 'package:imdb/presentation/common/widgets/gold_title_of_main_card.dart';
import 'package:imdb/presentation/pages/home/widgets/film_card.dart';
const double _horizontalPadding = 15;
const double _verticalPadding = 20;
class FilmsMainCard extends StatelessWidget {
  final String title;
  const FilmsMainCard(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GoldTitleOfMainCard(title: title),
          Padding(
            padding: REdgeInsetsDirectional.only(
                bottom: _verticalPadding, start: _verticalPadding),
            child: Text(
              "This week's top TV and movies",
              style: getNormalStyle(fontSize: 15, color: ColorManager.grey),
            ),
          ),
          SizedBox(
            height: 35.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              children: const [
                RSizedBox(width: _horizontalPadding),
                _SuggestionFilteredContainer(),
                RSizedBox(width: _horizontalPadding),
                _SuggestionFilteredContainer(),
                RSizedBox(width: _horizontalPadding),
                _SuggestionFilteredContainer(),
                RSizedBox(width: _horizontalPadding),
              ],
            ),
          ),
          Flexible(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                      padding: REdgeInsetsDirectional.only(
                          start: index == 0 ? _horizontalPadding : 8,
                          end: index == 9 ? _horizontalPadding : 0),
                      child: const Center(child: FilmCard()),
                    ),
                itemCount: 10),
          ),
        ],
      ),
    );
  }
}

class _SuggestionFilteredContainer extends StatefulWidget {
  const _SuggestionFilteredContainer({Key? key}) : super(key: key);

  @override
  State<_SuggestionFilteredContainer> createState() =>
      _SuggestionFilteredContainerState();
}

class _SuggestionFilteredContainerState
    extends State<_SuggestionFilteredContainer> {
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
