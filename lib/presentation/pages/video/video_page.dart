import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb/config/routes/route_app.dart';
import 'package:imdb/core/resources/color_manager.dart';
import 'package:imdb/core/resources/styles_manager.dart';
import 'package:imdb/core/utility/constant.dart';
import 'package:imdb/presentation/common/widgets/box_shadows.dart';
import 'package:imdb/presentation/common/widgets/floating_container.dart';
import 'package:imdb/presentation/common/widgets/gold_title_of_main_card.dart';
import 'package:imdb/presentation/common/widgets/suggestion_filtered_container.dart';
import 'package:imdb/presentation/pages/film_details/film_details_page.dart';
import 'package:imdb/presentation/pages/home/widgets/add_to_wach_list.dart';
import 'package:imdb/presentation/pages/home/widgets/film_card.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.veryLowOpacityGrey2,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...List.generate(5, (index) => const _VideosCard()),
              const RSizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _VideosCard extends StatelessWidget {
  const _VideosCard();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return FloatingContainer(
      height: screenHeight / 2.2,
      withPadding: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GoldTitleOfMainCard(title: "Popular trailers"),
          const RSizedBox(height: 15),
          SizedBox(
            height: 35.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              children: const [
                RSizedBox(width: horizontalPadding),
                SuggestionFilteredContainer(),
                RSizedBox(width: horizontalPadding),
                SuggestionFilteredContainer(),
                RSizedBox(width: horizontalPadding),
                SuggestionFilteredContainer(),
                RSizedBox(width: horizontalPadding),
              ],
            ),
          ),
          Flexible(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                      padding: REdgeInsetsDirectional.only(
                          start: index == 0 ? horizontalPadding : 8,
                          end: index == 9 ? horizontalPadding : 0),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            Go(context).to(const FilmDetailsPage());
                          },
                          child: Container(
                            height: 215.h,
                            width: 300.w,
                            decoration: BoxDecoration(
                              color: ColorManager.white,
                              borderRadius: BorderRadius.circular(10.r),
                              boxShadow: customBoxShadows(),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Stack(
                                    children: [
                                      SizedBox(
                                        height: 170.h,
                                        width: double.infinity,
                                        child: const StaticImage(),
                                      ),
                                      const Align(
                                          alignment: Alignment.topLeft,
                                          child: AddToWatchList()),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        REdgeInsets.symmetric(horizontal: 7),
                                    child: SizedBox(
                                      height: 45.h,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "The people We",
                                          maxLines: 2,
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                          style: getNormalStyle(fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                itemCount: 10),
          ),
        ],
      ),
    );
  }
}
