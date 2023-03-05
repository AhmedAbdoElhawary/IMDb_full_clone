import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb/helper/functions/network_exceptions.dart';
import 'package:imdb/helper/resources/color_manager.dart';
import 'package:imdb/helper/resources/styles_manager.dart';
import 'package:imdb/helper/routes/route_app.dart';
import 'package:imdb/helper/utility/constant.dart';
import 'package:imdb/view_models/film/film_details/film_details.dart';
import 'package:imdb/view_models/film/reviews/reviews_details.dart';
import 'package:imdb/views/bloc/film_info/film_info_cubit.dart';
import 'package:imdb/views/common_widgets/box_shadows.dart';
import 'package:imdb/views/common_widgets/custom_circulars_progress.dart';
import 'package:imdb/views/common_widgets/custom_elevated_button.dart';
import 'package:imdb/views/common_widgets/custom_outlined_button.dart';
import 'package:imdb/views/common_widgets/floating_container.dart';
import 'package:imdb/views/common_widgets/gold_title_of_main_card.dart';
import 'package:imdb/views/common_widgets/network_image_display.dart';
import 'package:imdb/views/common_widgets/rounded_keyword_container.dart';
import 'package:imdb/views/pages/details/sub_pages/actor_film_card.dart';
import 'package:imdb/views/pages/details/sub_pages/award_card.dart';
import 'package:imdb/views/pages/details/sub_pages/photos_card.dart';
import 'package:imdb/views/pages/details/sub_pages/user_reviews_page.dart';
import 'package:imdb/views/pages/home/widgets/actor_card.dart';
import 'package:imdb/views/pages/home/widgets/film_card.dart';

class FilmDetailsPage extends StatefulWidget {
  final String filmId;
  const FilmDetailsPage({required this.filmId, super.key});

  @override
  State<FilmDetailsPage> createState() => _FilmDetailsPageState();

}

class _FilmDetailsPageState extends State<FilmDetailsPage>
    with AutomaticKeepAliveClientMixin<FilmDetailsPage>{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<FilmInfoCubit, FilmInfoState>(
      bloc: FilmInfoCubit.get(context)..getFilmInfo(filmId: widget.filmId),
      buildWhen: (previous, current) => previous != current&& current is Loaded<FilmDetails>,
      builder: (context, FilmInfoState state) {
        if (state is Loaded<FilmDetails>) {
          FilmDetails filmDetails = state.details;
          filmDetails.similars;
          return Scaffold(
            backgroundColor: ColorManager.veryLowOpacityGrey2,
            appBar: appBar(filmDetails),
            body: ListView.separated(
                itemBuilder: (context, index) =>
                    listOfCards(filmDetails)[index],
                separatorBuilder: (context, index) =>
                    const RSizedBox(height: 20),
                itemCount: listOfCards(filmDetails).length),
          );
        } else if (state is Failed) {
          return Text(NetworkExceptions.getErrorMessage(state.error));
        } else {
          return const Scaffold(body: Center(child: CustomCircularProgress()));
        }
      },
    );
  }

  static List<Widget> listOfCards(FilmDetails filmDetails) {
    List<ActorList> actors = filmDetails.actorList;
    List<DirectorList> directors = filmDetails.directorList;

    return [
      _MainFilmInfoCard(filmDetails: filmDetails),
      _CastInfo(filmDetails: filmDetails),
      _MoreLikeThis("More like this", filmsSubInfoList: filmDetails.similars),
      if (filmDetails.images?.items.isNotEmpty ?? false)
        PhotosCard(filmDetails: filmDetails),
      if (filmDetails.awards.isNotEmpty) AwardsCard(awards: filmDetails.awards),
      _UserReviews(filmDetails: filmDetails),
      _StoryLine(filmDetails: filmDetails),
      _KeywordsCard(filmDetails: filmDetails),
      _DetailsCard(filmDetails: filmDetails),
      if (filmDetails.subBoxOffice != null)
        _BoxOfficeCard(filmDetails: filmDetails),
      if (actors.isNotEmpty)
        ActorFilmsCard("More from ${actors[0].name} (Actor)", id: actors[0].id),
      if (directors.isNotEmpty)
        ActorFilmsCard("More from ${directors[0].name} (Director)",
            id: directors[0].id),
      const RSizedBox(height: 0)
    ];
  }
  AppBar appBar(FilmDetails filmDetails) {
    return AppBar(
      title: Text(
        filmDetails.title,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
        style: getMediumStyle(fontSize: 20),
      ),
      actions: const [Icon(Icons.menu), RSizedBox(width: 15)],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _CastInfo extends StatelessWidget {
  const _CastInfo({Key? key, required this.filmDetails}) : super(key: key);
  final FilmDetails filmDetails;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return FloatingContainer(
      height: screenHeight / 1.32,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GoldTitleOfMainCard(title: "Cast"),
          Padding(
            padding: REdgeInsets.symmetric(
                horizontal: horizontalPadding, vertical: 10),
            child: Text("TOP BILLED CAST",
                style:
                    getNormalStyle(fontSize: 13, color: ColorManager.black54)),
          ),
          Flexible(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  ActorList actorDetails = filmDetails.actorList[index];
                  return Padding(
                    padding: REdgeInsetsDirectional.only(
                        start: index == 0 ? horizontalPadding : 8,
                        end: index == 9 ? horizontalPadding : 0),
                    child: Center(
                        child: ActorCard(
                      actorId: actorDetails.id,
                      image: actorDetails.image,
                      title: actorDetails.name,
                      subTitle: actorDetails.asCharacter,
                    )),
                  );
                },
                itemCount: filmDetails.actorList.length),
          ),
          Padding(
            padding: REdgeInsets.all(horizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Director", style: getNormalStyle(fontSize: 17)),
                Text(filmDetails.directors,
                    style: getNormalStyle(
                        fontSize: 14, color: ColorManager.black54)),
                const RSizedBox(height: 20),
                Text("Writers", style: getNormalStyle(fontSize: 17)),
                Text(filmDetails.writers,
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: getNormalStyle(
                        fontSize: 14, color: ColorManager.black54)),
                const RSizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    /// Todo: push to ALL CAST & CREW
                  },
                  child: Text("ALL CAST & CREW",
                      style: getMediumStyle(
                          fontSize: 15, color: ColorManager.darkBlue)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _UserReviews extends StatelessWidget {
  const _UserReviews({Key? key, required this.filmDetails}) : super(key: key);
  final FilmDetails filmDetails;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;
    double screenWidth = screenSize.width;

    return FloatingContainer(
      height: screenHeight / 1.85,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GoldTitleOfMainCard(title: "User reviews"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text("IMDB Rating", style: getNormalStyle(fontSize: 17)),
                    const RSizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.star_border,
                            color: ColorManager.blackYellow, size: 30),
                        const RSizedBox(width: 5),
                        Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: filmDetails.imDbRating,
                                  style: getNormalStyle(fontSize: 30)),
                              TextSpan(
                                style: getNormalStyle(fontSize: 15),
                                text: "/10",
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Your Rating", style: getNormalStyle(fontSize: 17)),
                    const RSizedBox(height: 13.5),
                    Row(
                      children: [
                        const Icon(Icons.star_border,
                            color: ColorManager.darkBlue, size: 30),
                        const RSizedBox(width: 5),
                        Text("Rate",
                            style: getNormalStyle(
                                fontSize: 17, color: ColorManager.darkBlue))
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                const Spacer(),
              ],
            ),
          ),
          Padding(
            padding: REdgeInsets.all(horizontalPadding),
            child: CustomElevatedButton(
                backgroundColor: ColorManager.blackYellow,
                withoutPadding: true,
                child: Row(
                  children: [
                    const Icon(Icons.add),
                    const RSizedBox(width: 15),
                    Text("Add a Review", style: getNormalStyle(fontSize: 18))
                  ],
                ),
                onPressed: () {}),
          ),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: horizontalPadding),
            child:
                Text("Featured Reviews", style: getNormalStyle(fontSize: 17)),
          ),
          Flexible(
            child: BlocBuilder<FilmInfoCubit, FilmInfoState>(
              bloc: FilmInfoCubit.get(context)
                ..getReviewsOfFilm(filmId: filmDetails.id),
              buildWhen: (previous, current) => previous != current,
              builder: (context, state) {
                if (state is Loaded<ReviewsDetails>) {
                  List<ReviewsItems> items = state.details.items;
                  return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return _BuildSubReviews(
                          items: items,
                          screenWidth: screenWidth,
                          index: index,
                        );
                      },
                      itemCount: min(items.length, 10));
                } else if (state is Failed) {
                  return Center(
                      child:
                          Text(NetworkExceptions.getErrorMessage(state.error)));
                } else {
                  return const CustomCircularProgress();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _BuildSubReviews extends StatelessWidget {
  const _BuildSubReviews({
    Key? key,
    required this.items,
    required this.index,
    required this.screenWidth,
  }) : super(key: key);

  final List<ReviewsItems> items;
  final double screenWidth;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsetsDirectional.only(
          start: index == 0 ? horizontalPadding : 10,
          end: index == 9 ? horizontalPadding : 0),
      child: Center(
        child: GestureDetector(
          onTap: () {
            Go(context).to(UserReviewsPage(items));
          },
          child: Container(
            height: 155.h,
            width: screenWidth / 1.33,
            decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: customBoxShadows()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.star, color: ColorManager.blackYellow),
                    Text(items[index].rate)
                  ],
                ),
                Text(
                  items[index].title,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: getMediumStyle(fontSize: 15),
                ),
                Text(
                  items[index].content,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                  style: getNormalStyle(fontSize: 15, color: ColorManager.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GuideOfParents extends StatefulWidget {
  const _GuideOfParents({Key? key, required this.filmDetails})
      : super(key: key);
  final FilmDetails filmDetails;
  @override
  State<_GuideOfParents> createState() => _GuideOfParentsState();
}

class _GuideOfParentsState extends State<_GuideOfParents> {
  bool flipList = false;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;

    return FloatingContainer(
      height: flipList ? screenHeight / 3.8 : screenHeight / 1.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GoldTitleOfMainCard(title: "Parents'Guide"),
          const RSizedBox(height: 10),
          Padding(
            padding: REdgeInsets.symmetric(
                horizontal: horizontalPadding, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Content Rating", style: getNormalStyle(fontSize: 17)),
                Text("Rated PG-13 for sequences of intense action, and " * 5,
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: getNormalStyle(
                        fontSize: 15, color: ColorManager.black54)),
                const RSizedBox(height: 10),
                if (!flipList) ..._flagsList(),
                const RSizedBox(height: 15),
                Center(
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            flipList = !flipList;
                          });
                        },
                        child: Icon(flipList
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_up)))
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _flagsList() {
    return List.generate(
      5,
      (index) => Padding(
        padding: REdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Row(
          children: [
            Container(
              height: 30,
              width: 15,
              decoration: BoxDecoration(
                  color: ColorManager.green,
                  borderRadius: BorderRadius.circular(2)),
            ),
            const RSizedBox(width: 5),
            Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: "Sex and nudity:",
                      style: getNormalStyle(fontSize: 15)),
                  TextSpan(
                    style:
                        getNormalStyle(fontSize: 15, color: ColorManager.grey),
                    text: " None",
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StoryLine extends StatelessWidget {
  const _StoryLine({Key? key, required this.filmDetails}) : super(key: key);
  final FilmDetails filmDetails;
  @override
  Widget build(BuildContext context) {
    return FloatingContainer(
      height: -1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GoldTitleOfMainCard(title: "Storyline", withoutSeeAll: true),
          const RSizedBox(height: 10),
          _TitleAndSubTitleTexts(
            title: "Plot Summary",
            subTitle: filmDetails.plot,
          ),
          const Divider(color: ColorManager.grey),
          const _TitleAndSubTitleTexts(
              title: "Tagline",
              subTitle: "Feel the need... The need for speed."),
          const Divider(color: ColorManager.grey),
          const _TitleAndSubTitleTexts(
              title: "Synopsis", subTitle: "WARNING: Spoilers"),
          const Divider(color: ColorManager.grey),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Text("Genres", style: getNormalStyle(fontSize: 16)),
          ),
          const RSizedBox(height: 10),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: horizontalPadding),
            child: SizedBox(
              height: 40.h,
              width: double.infinity,
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => RoundedKeywordContainer(
                      text: filmDetails.genreList[index].value),
                  separatorBuilder: (context, index) =>
                      const RSizedBox(width: 8),
                  itemCount: filmDetails.genreList.length),
            ),
          ),
          const RSizedBox(height: 15),
        ],
      ),
    );
  }
}

class _KeywordsCard extends StatelessWidget {
  const _KeywordsCard({Key? key, required this.filmDetails}) : super(key: key);
  final FilmDetails filmDetails;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;

    return FloatingContainer(
      height: screenHeight / 3.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GoldTitleOfMainCard(title: "Keywords"),
          const RSizedBox(height: 10),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: REdgeInsets.symmetric(vertical: 10),
                    child:
                        Text("SUBGENRES", style: getMediumStyle(fontSize: 15))),
                SizedBox(
                  height: 40.h,
                  width: double.infinity,
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => RoundedKeywordContainer(
                          text: filmDetails.genreList[index].value),
                      separatorBuilder: (context, index) =>
                          const RSizedBox(width: 8),
                      itemCount: filmDetails.genreList.length),
                ),

                ///------------------------------------->

                Padding(
                    padding: REdgeInsets.symmetric(vertical: 10),
                    child: Text("PLOT DETAILS",
                        style: getMediumStyle(fontSize: 15))),
                SizedBox(
                  height: 40.h,
                  width: double.infinity,
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => RoundedKeywordContainer(
                          text: filmDetails.keywordList[index]),
                      separatorBuilder: (context, index) =>
                          const RSizedBox(width: 8),
                      itemCount: filmDetails.keywordList.length),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailsCard extends StatelessWidget {
  const _DetailsCard({Key? key, required this.filmDetails}) : super(key: key);
  final FilmDetails filmDetails;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;

    return FloatingContainer(
      height: screenHeight / 3.15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GoldTitleOfMainCard(title: "Details", withoutSeeAll: true),
          const RSizedBox(height: 10),
          _TitleAndSubTitleTexts(
              title: "Release Date", subTitle: filmDetails.releaseDate),
          const Divider(color: ColorManager.grey),
          _TitleAndSubTitleTexts(
              title: "Country of Origin", subTitle: filmDetails.countries),
          const Divider(color: ColorManager.grey),
          _TitleAndSubTitleTexts(
              title: "Language Spoken", subTitle: filmDetails.languages),
        ],
      ),
    );
  }
}

class _BoxOfficeCard extends StatelessWidget {
  const _BoxOfficeCard({Key? key, required this.filmDetails}) : super(key: key);
  final FilmDetails filmDetails;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;
    SubBoxOffice? boxOffice = filmDetails.subBoxOffice;
    return FloatingContainer(
      height: screenHeight / 2.75,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GoldTitleOfMainCard(title: "Box office"),
          const RSizedBox(height: 10),
          _TitleAndSubTitleTexts(
              title: "Budget", subTitle: boxOffice?.budget ?? ""),
          const Divider(color: ColorManager.grey),
          _TitleAndSubTitleTexts(
              title: "Opening weekend",
              subTitle: boxOffice?.openingWeekendUSA ?? ""),
          const Divider(color: ColorManager.grey),
          _TitleAndSubTitleTexts(
              title: "Gross", subTitle: boxOffice?.grossUSA ?? ""),
          const Divider(color: ColorManager.grey),
          _TitleAndSubTitleTexts(
              title: "Worldwide gross",
              subTitle: boxOffice?.cumulativeWorldwideGross ?? ""),
        ],
      ),
    );
  }
}

class _TitleAndSubTitleTexts extends StatelessWidget {
  final String title;
  final String subTitle;
  const _TitleAndSubTitleTexts(
      {Key? key,
      this.title = "Metacritic",
      this.subTitle = "4 wins & 16 nominations "})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: getNormalStyle(fontSize: 16)),
          const RSizedBox(height: 5),
          Text(subTitle,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
              style: getNormalStyle(fontSize: 15, color: ColorManager.black54)),
        ],
      ),
    );
  }
}

class _MoreLikeThis extends StatelessWidget {
  final String title;
  const _MoreLikeThis(this.title, {required this.filmsSubInfoList});
  final List<Similars> filmsSubInfoList;
  @override
  Widget build(BuildContext context) {
    return FloatingContainer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GoldTitleOfMainCard(title: title),
          Flexible(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Similars info = filmsSubInfoList[index];
                  return Padding(
                    padding: REdgeInsetsDirectional.only(
                        start: index == 0 ? horizontalPadding : 8,
                        end: index == 9 ? horizontalPadding : 0),
                    child: Center(
                        child: FilmCard(
                      id: info.id,
                      image: info.image,
                      imdbRating: info.imDbRating,
                      title: info.title,
                    ),),
                  );
                },
                itemCount: filmsSubInfoList.length),
          ),
        ],
      ),
    );
  }
}

class _MainFilmInfoCard extends StatelessWidget {
  const _MainFilmInfoCard({Key? key, required this.filmDetails})
      : super(key: key);
  final FilmDetails filmDetails;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return FloatingContainer(
      height: screenHeight / 1.175,
      child: Padding(
        padding: REdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _FilmTitleAndSubNumbersInfo(filmDetails),
            FilmTrailerPreview(filmDetails),
            _PosterAndSubInfo(filmDetails),
            const _AddToWatchListButton(),
            const RSizedBox(height: 5),
            const Divider(color: ColorManager.grey),
            _ScoresWidgets(filmDetails),
          ],
        ),
      ),
    );
  }
}

class FilmTrailerPreview extends StatelessWidget {
  const FilmTrailerPreview(this.filmDetails, {Key? key}) : super(key: key);
  final FilmDetails filmDetails;
  @override
  Widget build(BuildContext context) {
    String url = filmDetails.trailer?.thumbnailUrl ?? "";
    return Container(
      color: ColorManager.lightGrey,
      width: double.infinity,
      height: 225.h,
      child: url.isNotEmpty ? NetworkImageDisplay(url) : null,
    );
  }
}

class _ScoresWidgets extends StatelessWidget {
  const _ScoresWidgets(this.filmDetails);
  final FilmDetails filmDetails;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _RatingInfo(filmDetails),
        _RateThis(filmDetails),
        _Metascore(filmDetails),
      ],
    );
  }
}

class _Metascore extends StatelessWidget {
  const _Metascore(this.filmDetails);
  final FilmDetails filmDetails;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: REdgeInsets.all(5),
          color: ColorManager.green,
          child: Text(filmDetails.metacriticRating,
              style: getNormalStyle(color: ColorManager.white)),
        ),
        const RSizedBox(height: 10),
        Text("Metascore", style: getNormalStyle(fontSize: 13)),
      ],
    );
  }
}

class _RateThis extends StatelessWidget {
  const _RateThis(this.filmDetails);
  final FilmDetails filmDetails;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(Icons.star_border, color: ColorManager.blue, size: 30),
        const RSizedBox(height: 7.5),
        Text("Rate this",
            style: getNormalStyle(fontSize: 17, color: ColorManager.blue)),
        const RSizedBox(height: 7.5),
      ],
    );
  }
}

class _RatingInfo extends StatelessWidget {
  const _RatingInfo(this.filmDetails);
  final FilmDetails filmDetails;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(Icons.star, color: ColorManager.blackYellow, size: 30),
        Text.rich(
          TextSpan(
            children: <TextSpan>[
              TextSpan(
                  text: filmDetails.imDbRating,
                  style: getBoldStyle(fontSize: 20)),
              TextSpan(
                style: getNormalStyle(fontSize: 15),
                text: "/10",
              )
            ],
          ),
        ),
        Text(filmDetails.imDbRatingVotes,
            style: getNormalStyle(fontSize: 13, color: ColorManager.grey))
      ],
    );
  }
}

class _AddToWatchListButton extends StatefulWidget {
  const _AddToWatchListButton({Key? key}) : super(key: key);

  @override
  State<_AddToWatchListButton> createState() => _AddToWatchListButtonState();
}

class _AddToWatchListButtonState extends State<_AddToWatchListButton> {
  bool isItAdded = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          REdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 7.5),
      child: isItAdded
          ? CustomOutlinedButton(
              roundedColor: ColorManager.blackYellow,
              onPressed: () {
                setState(() {
                  isItAdded = false;
                });
              },
              child: Row(
                children: [
                  const Icon(Icons.check, color: ColorManager.black),
                  const RSizedBox(width: 15),
                  Text("Added to watchlist",
                      style: getNormalStyle(fontSize: 18)),
                ],
              ),
            )
          : CustomElevatedButton(
              backgroundColor: ColorManager.blackYellow,
              withoutPadding: true,
              child: Row(
                children: [
                  const Icon(Icons.add),
                  const RSizedBox(width: 15),
                  Text("Add to watchlist", style: getNormalStyle(fontSize: 18))
                ],
              ),
              onPressed: () {
                setState(() {
                  isItAdded = true;
                });
              }),
    );
  }
}

class _FilmTitleAndSubNumbersInfo extends StatelessWidget {
  const _FilmTitleAndSubNumbersInfo(this.filmDetails, {Key? key})
      : super(key: key);
  final FilmDetails filmDetails;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: REdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Text(
          filmDetails.title,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          style: getNormalStyle(fontSize: 35),
        ),
      ),
      Padding(
        padding:
            REdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 5),
        child: Text(
          "${filmDetails.year}  ${filmDetails.contentRating}  ${filmDetails.runtimeStr}",
          style: getNormalStyle(fontSize: 15, color: ColorManager.grey),
        ),
      ),
    ]);
  }
}

class _PosterAndSubInfo extends StatelessWidget {
  const _PosterAndSubInfo(this.filmDetails);
  final FilmDetails filmDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          REdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 108.w,
            height: 160.h,
            child: NetworkImageDisplay(filmDetails.image, fit: BoxFit.cover),
          ),
          const RSizedBox(width: horizontalPadding),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40.h,
                  width: double.infinity,
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        GenreList genre = filmDetails.genreList[index];
                        return RoundedKeywordContainer(text: genre.value);
                      },
                      separatorBuilder: (context, index) =>
                          const RSizedBox(width: 8),
                      itemCount: filmDetails.genreList.length),
                ),
                const RSizedBox(height: 15),
                Text(
                  filmDetails.plot,
                  softWrap: true,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: getNormalStyle(fontSize: 15),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
