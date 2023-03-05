import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb/helper/functions/network_exceptions.dart';
import 'package:imdb/helper/resources/color_manager.dart';
import 'package:imdb/helper/resources/styles_manager.dart';
import 'package:imdb/helper/routes/route_app.dart';
import 'package:imdb/view_models/box_office/box_office_items.dart';
import 'package:imdb/view_models/in_theaters/new_film_details.dart';
import 'package:imdb/views/bloc/box_office/box_office_cubit.dart';
import 'package:imdb/views/bloc/cubit_result_state.dart';
import 'package:imdb/views/bloc/new_films/new_films.dart';
import 'package:imdb/views/common_widgets/custom_circulars_progress.dart';
import 'package:imdb/views/common_widgets/films_main_floating_container.dart';
import 'package:imdb/views/common_widgets/floating_container.dart';
import 'package:imdb/views/common_widgets/gold_title_of_main_card.dart';
import 'package:imdb/views/pages/details/film_details_page.dart';
import 'package:imdb/views/pages/home/widgets/actor_card.dart';
import 'package:imdb/views/pages/home/widgets/add_to_wach_list.dart';
import 'package:imdb/views/pages/home/widgets/film_card.dart';

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
              _DynamicMovedPageView(screenHeightOver3: screenHeightOver3),
              const _MainTitle("Featured today"),
              FloatingContainer(
                height: screenHeightOver3 / 0.94,
                child: const Center(child: Text("Not now")),
              ),
              const _MainTitle("What to watch"),
              // const FilmsMainCard("From your watchlist"),
              const RSizedBox(height: _verticalPadding),
              // const FilmsMainCard("Fan favorites"),
              const _MainTitle("Explore movies and TV shows"),
              const _InTheaters(),
              const RSizedBox(height: _verticalPadding),
              const _InTheaters(),
              const RSizedBox(height: _verticalPadding),
              const _TopBoxOfficeCard(),
              const RSizedBox(height: _verticalPadding),
              const _ComingSoon(),
              const _BornTodayMainCard(),
              const RSizedBox(height: _verticalPadding),
            ],
          ),
        ),
      ),
    );
  }
}

class _DynamicMovedPageView extends StatelessWidget {
  const _DynamicMovedPageView({required this.screenHeightOver3});

  final double screenHeightOver3;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeightOver3 * 1.16,
      width: double.infinity,
      child: PageView.builder(
        itemBuilder: (context, index) => SizedBox(
          height: screenHeightOver3,
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: screenHeightOver3 / 1.1,
                child: const StaticImage(),
              ),
              Positioned(
                  height: screenHeightOver3 * 1.08,
                  child: const _PosterAndSubInfo()),
            ],
          ),
        ),
        itemCount: 5,
      ),
    );
  }
}

class _InTheaters extends StatelessWidget {
  const _InTheaters();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<NewFilmsCubit, ResultState<NewFilmDetails>>(
        bloc: NewFilmsCubit.get(context)..getInTheaters(),
        buildWhen: (previous, current) => previous != current,
        builder: (context, ResultState<NewFilmDetails> state) {
          return state.when(
            initial: () => const CustomCircularProgress(),
            loading: () => const CustomCircularProgress(),
            success: (NewFilmDetails data) {
              return FilmsMainCard("In theaters", filmItems: data.items);
            },
            error: (e) {
              return Text(NetworkExceptions.getErrorMessage(e));
            },
          );
        },
      ),
    );
  }
}

class _ComingSoon extends StatelessWidget {
  const _ComingSoon();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<NewFilmsCubit, ResultState<NewFilmDetails>>(
        bloc: NewFilmsCubit.get(context)..getComingSoon(),
        buildWhen: (previous, current) => previous != current,
        builder: (context, ResultState<NewFilmDetails> state) {
          return state.when(
            initial: () => const CustomCircularProgress(),
            loading: () => const CustomCircularProgress(),
            success: (NewFilmDetails data) {
              return FilmsMainCard("Coming soon", filmItems: data.items);
            },
            error: (e) {
              return Text(NetworkExceptions.getErrorMessage(e));
            },
          );
        },
      ),
    );
  }
}

class _TopBoxOfficeCard extends StatelessWidget {
  const _TopBoxOfficeCard();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<BoxOfficeCubit, BoxOfficeState>(
        bloc: BoxOfficeCubit.get(context)..getBoxOffice(),
        buildWhen: (previous, current) => previous != current,
        builder: (context, BoxOfficeState state) {
          if (state is CubitBoxOfficeLoaded) {
            return _TopBoxOfficeBody(state.details.items);
          } else if (state is CubitFailed) {
            return Text(NetworkExceptions.getErrorMessage(state.error));
          } else {
            return const CustomCircularProgress();
          }
        },
      ),
    );
  }
}

class _TopBoxOfficeBody extends StatelessWidget {
  const _TopBoxOfficeBody(this.boxOfficeItems);
  final List<BoxOfficeItems>? boxOfficeItems;

  @override
  Widget build(BuildContext context) {
    int length = boxOfficeItems?.length ?? 0;
    return FloatingContainer(
      height: -1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
                itemBuilder: (context, index) {
                  BoxOfficeItems? item = boxOfficeItems?[index];
                  return GestureDetector(
                    onTap: () {
                      String id = item?.id ?? "";
                      if (id.isNotEmpty) {
                        Go(context).to(FilmDetailsPage(filmId: id));
                      }
                    },
                    child: Row(
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
                                item?.title ?? "",
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: getNormalStyle(fontSize: 15),
                              ),
                              Text(
                                item?.weekend ?? "",
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
                  );
                },
                itemCount: length >= 7 ? 7 : length,
                separatorBuilder: (context, index) =>
                    const RSizedBox(height: 18),
              ),
            ),
          ),
          const RSizedBox(height: 15),
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
        mainAxisSize: MainAxisSize.min,
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
                      child: const Center(child: ActorCard()),
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
            decoration: BoxDecoration(boxShadow: [
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
