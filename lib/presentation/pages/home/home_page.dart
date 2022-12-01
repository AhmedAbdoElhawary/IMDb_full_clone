import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb/core/resources/color_manager.dart';
import 'package:imdb/core/resources/styles_manager.dart';
import 'package:imdb/presentation/common/widgets/films_main_floating_container.dart';
import 'package:imdb/presentation/common/widgets/floating_container.dart';
import 'package:imdb/presentation/common/widgets/gold_title_of_main_card.dart';
import 'package:imdb/presentation/pages/home/widgets/actor_birth_day_card.dart';
import 'package:imdb/presentation/pages/home/widgets/add_to_wach_list.dart';
import 'package:imdb/presentation/pages/home/widgets/film_card.dart';

const double _horizontalPadding = 15;
const double _verticalPadding = 20;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    double screenHeightOver3 = screenHeight / 3.16;
    return Scaffold(
      backgroundColor: ColorManager.veryLowOpacityGrey2,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeightOver3 * 1.16,
                width: double.infinity,
                child: PageView.builder(
                  itemBuilder: (context, index) => SizedBox(
                    height: screenHeightOver3,
                    child: Stack(
                      children: [
                        Container(
                          color: ColorManager.purple,
                          height: screenHeightOver3 / 1.1,
                          child: const SizedBox(
                            width: double.infinity,
                            child: StaticImage(),
                          ),
                        ),
                        Positioned(
                            height: screenHeightOver3 * 1.08,
                            child: const _PosterAndSubInfo()),
                      ],
                    ),
                  ),
                  itemCount: 5,
                ),
              ),
              const _MainTitle("Featured today"),
              FloatingContainer(
                height: screenHeightOver3 / 0.94,
                child: const Center(child: Text("Not now")),
              ),
              const _MainTitle("What to watch"),
              const FilmsMainCard("From your watchlist"),
              const RSizedBox(height: _verticalPadding),
              const FilmsMainCard("Fan favorites"),
              const _MainTitle("Explore movies and TV shows"),
              const FilmsMainCard("In theaters"),
              const RSizedBox(height: _verticalPadding),
              const FilmsMainCard("Coming soon"),
              const RSizedBox(height: _verticalPadding),
              const _TopBoxOfficeCard(),
              const RSizedBox(height: _verticalPadding),
              const FilmsMainCard("Watch soon at home"),
              const _BornTodayMainCard(),
              const RSizedBox(height: _verticalPadding * 25),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopBoxOfficeCard extends StatelessWidget {
  const _TopBoxOfficeCard();

  @override
  Widget build(BuildContext context) {
    return FloatingContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GoldTitleOfMainCard(title: "Top box office"),
          Padding(
            padding: REdgeInsetsDirectional.only(
                bottom: _verticalPadding, start: _verticalPadding),
            child: Text(
              "Weekend of November 25 - 27",
              style: getNormalStyle(fontSize: 15, color: ColorManager.grey),
            ),
          ),
          Flexible(
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: _horizontalPadding),
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index) => Row(
                  children: [
                    Text("${index + 1}"),
                    SizedBox(width: 10.w),
                    const AddToWatchList(),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Black Panther:Wakanda Foreever" * 5,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: getNormalStyle(fontSize: 15),
                          ),
                          Text(
                            "\$45.5M",
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: getNormalStyle(
                                fontSize: 15, color: ColorManager.grey),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10.w),
                    const Icon(
                      Icons.battery_charging_full_rounded,
                      color: ColorManager.darkBlue,
                    )
                  ],
                ),
                itemCount: 6,
                separatorBuilder: (context, index) =>
                    const RSizedBox(height: 18),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _MainTitle extends StatelessWidget {
  final String title;
  const _MainTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(
          horizontal: _horizontalPadding, vertical: _verticalPadding),
      child: Text(title, style: getBoldStyle(fontSize: 22)),
    );
  }
}

class _BornTodayMainCard extends StatelessWidget {
  const _BornTodayMainCard();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return FloatingContainer(
      height: screenHeight / 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GoldTitleOfMainCard(
              title: "Born today", withoutVerticalPadding: true),
          Flexible(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                      padding: REdgeInsetsDirectional.only(
                          start: index == 0 ? _horizontalPadding : 8,
                          end: index == 9 ? _horizontalPadding : 0),
                      child: const Center(child: ActorBirthdayCard()),
                    ),
                itemCount: 10),
          ),
        ],
      ),
    );
  }
}

class _PosterAndSubInfo extends StatelessWidget {
  const _PosterAndSubInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsetsDirectional.only(start: _horizontalPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 147.h,
            width: 100.w,
            decoration:
                BoxDecoration(color: ColorManager.redAccent, boxShadow: [
              BoxShadow(
                color: ColorManager.grey.withOpacity(.55),
                spreadRadius: 1.5,
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ]),
            child: const StaticImage(),
          ),
          const RSizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Babylon", style: getNormalStyle(fontSize: 15)),
              const RSizedBox(height: 2),
              Text("Official Trailer", style: getNormalStyle(fontSize: 10)),
            ],
          ),
        ],
      ),
    );
  }
}
