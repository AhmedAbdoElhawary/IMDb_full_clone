import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb/helper/functions/network_exceptions.dart';
import 'package:imdb/helper/resources/color_manager.dart';
import 'package:imdb/helper/resources/styles_manager.dart';
import 'package:imdb/helper/routes/route_app.dart';
import 'package:imdb/helper/utility/constant.dart';
import 'package:imdb/view_models/film/film_details/film_details.dart';
import 'package:imdb/view_models/film/image/image_details.dart';
import 'package:imdb/views/bloc/film_info/film_info_cubit.dart';
import 'package:imdb/views/common_widgets/box_shadows.dart';
import 'package:imdb/views/common_widgets/custom_circulars_progress.dart';
import 'package:imdb/views/common_widgets/custom_elevated_button.dart';
import 'package:imdb/views/common_widgets/custom_outlined_button.dart';
import 'package:imdb/views/common_widgets/floating_container.dart';
import 'package:imdb/views/common_widgets/gold_title_of_main_card.dart';
import 'package:imdb/views/common_widgets/suggestion_filtered_container.dart';
import 'package:imdb/views/pages/films_filtered/films_filtered_page.dart';
import 'package:imdb/views/pages/home/widgets/actor_card.dart';
import 'package:imdb/views/pages/home/widgets/film_card.dart';

class FilmDetailsPage extends StatelessWidget {
  final String filmId;
  const FilmDetailsPage({required this.filmId, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilmInfoCubit, FilmInfoState>(
      bloc: FilmInfoCubit.get(context)..getFilmInfo(filmId: filmId),
      buildWhen: (previous, current) => previous != current,
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

  static List<Widget> listOfCards(FilmDetails filmDetails) => [
        _MainFilmInfoCard(filmDetails: filmDetails),
        _CastInfo(filmDetails: filmDetails),
        _FilmsMainCard("More like this",
            filmsSubInfoList: filmDetails.similars),
        // _VideosCard(filmDetails: filmDetails),
        if (filmDetails.images?.items.isNotEmpty ?? false)
          _PhotosCard(filmDetails: filmDetails),
        _AwardsCard(filmDetails: filmDetails),
        _UserReviews(filmDetails: filmDetails),
        _CriticReviews(filmDetails: filmDetails),
        _GuideOfParents(filmDetails: filmDetails),
        _DidYouKnow(filmDetails: filmDetails),
        _StoryLine(filmDetails: filmDetails),
        _KeywordsCard(filmDetails: filmDetails),
        _DetailsCard(filmDetails: filmDetails),
        if (filmDetails.subBoxOffice != null)
          _BoxOfficeCard(filmDetails: filmDetails),
        // const _TechnicalSpaces(),
        _FilmsMainCard("More from Tom Cruise (Actor)",
            filmsSubInfoList: filmDetails.similars),
        _FilmsMainCard("More from Joseph Kosinski (Director)",
            filmsSubInfoList: filmDetails.similars),
        _FilmsMainCard("More drama picks",
            filmsSubInfoList: filmDetails.similars),
        const RSizedBox(height: 0)
      ];
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
                      imageUrl: actorDetails.image,
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

class _PhotosCard extends StatelessWidget {
  const _PhotosCard({Key? key, required this.filmDetails}) : super(key: key);
  final FilmDetails filmDetails;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;
    double screenWidth = screenSize.width;
    List<Items> imagesList = filmDetails.images?.items ?? [];
    int imagesLength = imagesList.length;

    return FloatingContainer(
      height: screenHeight / 2.95,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GoldTitleOfMainCard(title: "Photos", subTitle: "$imagesLength"),
          Flexible(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  String imageUrl = imagesList[index].image;
                  return Padding(
                    padding: REdgeInsetsDirectional.only(
                        start: index == 0 ? horizontalPadding : 10,
                        end: index == 9 ? horizontalPadding : 0),
                    child: Center(
                      child: Container(
                        height: 155.h,
                        width: screenWidth / 1.33,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            boxShadow: customBoxShadows()),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: Image.network(imageUrl, fit: BoxFit.cover)),
                      ),
                    ),
                  );
                },
                itemCount: imagesLength),
          ),
        ],
      ),
    );
  }
}

class _AwardsCard extends StatelessWidget {
  const _AwardsCard({Key? key, required this.filmDetails}) : super(key: key);
  final FilmDetails filmDetails;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;
    List<String> firstList = filmDetails.awards.split(" | ");
    String topFilm = firstList.isNotEmpty ? firstList[0] : "";
    List<String> secondList =
        firstList.length > 1 ? firstList[1].split(", ") : [];
    return FloatingContainer(
      height: screenHeight / 4.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GoldTitleOfMainCard(title: "Awards"),
          const RSizedBox(height: 10),
          if (topFilm.isNotEmpty)
            Padding(
              padding: REdgeInsets.symmetric(
                  horizontal: horizontalPadding, vertical: 20),
              child: Text(topFilm, style: getNormalStyle(fontSize: 18)),
            ),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (secondList.isNotEmpty || secondList[0].isNotEmpty)
                  Text(secondList[0], style: getNormalStyle(fontSize: 18)),
                if (secondList.length > 1 || secondList[1].isNotEmpty)
                  Text(secondList[1],
                      style: getNormalStyle(
                          fontSize: 16, color: ColorManager.grey)),
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
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                      padding: REdgeInsetsDirectional.only(
                          start: index == 0 ? horizontalPadding : 10,
                          end: index == 9 ? horizontalPadding : 0),
                      child: Center(
                        child: Container(
                          height: 155.h,
                          width: screenWidth / 1.33,
                          decoration: BoxDecoration(
                              color: ColorManager.teal,
                              borderRadius: BorderRadius.circular(10.r),
                              boxShadow: customBoxShadows()),
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

class _CriticReviews extends StatelessWidget {
  const _CriticReviews({Key? key, required this.filmDetails}) : super(key: key);
  final FilmDetails filmDetails;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;

    return FloatingContainer(
      height: screenHeight / 3.2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GoldTitleOfMainCard(
              title: "Critic reviews", withoutSeeAll: true),
          const RSizedBox(height: 10),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Metacritic", style: getNormalStyle(fontSize: 17)),
                Padding(
                  padding: REdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      Container(
                          height: 25.h, width: 25.w, color: ColorManager.green),
                      const RSizedBox(width: 5),
                      Text("Metascore (based on 63 reviews)",
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: getNormalStyle(
                              fontSize: 15, color: ColorManager.black54)),
                    ],
                  ),
                ),
                Text("4 wins & 16 nominations " * 5,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: getNormalStyle(
                        fontSize: 15, color: ColorManager.black54)),
                const RSizedBox(height: 15),
                Padding(
                  padding: REdgeInsets.symmetric(vertical: 5),
                  child: Text("Critic reviews",
                      style: getNormalStyle(fontSize: 17)),
                ),
                Text("4 wins & 16 nominations " * 5,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: getNormalStyle(
                        fontSize: 15, color: ColorManager.black54)),
              ],
            ),
          ),
        ],
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

class _DidYouKnow extends StatelessWidget {
  const _DidYouKnow({Key? key, required this.filmDetails}) : super(key: key);
  final FilmDetails filmDetails;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;

    return FloatingContainer(
      height: screenHeight / 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GoldTitleOfMainCard(
              title: "Did you know?", withoutSeeAll: true),
          const RSizedBox(height: 10),
          Flexible(
            child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Padding(
                      padding:
                          REdgeInsets.symmetric(horizontal: horizontalPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Metacritic",
                              style: getNormalStyle(fontSize: 16)),
                          const RSizedBox(height: 7),
                          Text("4 wins & 16 nominations " * 15,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                              style: getNormalStyle(
                                  fontSize: 15, color: ColorManager.black54)),
                          const RSizedBox(height: 7),
                        ],
                      ),
                    ),
                separatorBuilder: (context, index) =>
                    const Divider(color: ColorManager.grey),
                itemCount: 6),
          ),
        ],
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
          SizedBox(
            height: 40.h,
            width: double.infinity,
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => _RoundedActionContainer(
                    text: filmDetails.genreList[index].value),
                separatorBuilder: (context, index) => const RSizedBox(width: 8),
                itemCount: filmDetails.genreList.length),
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
                      itemBuilder: (context, index) => _RoundedActionContainer(
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
                      itemBuilder: (context, index) => _RoundedActionContainer(
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

List<String> listOfText() => [
      "team action",
      "one person army action",
      "epic drama",
      "team action",
      "one person army action",
      "epic drama",
      "team action",
      "one person army action",
      "epic drama",
      "team action",
      "one person army action",
      "epic drama",
      "team action",
      "one person army action",
      "epic drama",
    ];

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
            child: Image.network(filmDetails.image, fit: BoxFit.cover),
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
                        return _RoundedActionContainer(text: genre.value);
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

class _RoundedActionContainer extends StatelessWidget {
  final String text;
  const _RoundedActionContainer({Key? key, this.text = "Action"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Go(context).to(const FilmsFiltered());
      },
      child: Container(
        padding: REdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: ColorManager.grey, width: 1)),
        child: Center(
          child: Text(text, style: getNormalStyle(fontSize: 15)),
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
      child: url.isNotEmpty ? Image.network(url) : null,
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

class _FilmsMainCard extends StatelessWidget {
  final String title;
  const _FilmsMainCard(this.title, {required this.filmsSubInfoList});
  final List<Similars> filmsSubInfoList;
  @override
  Widget build(BuildContext context) {
    return FloatingContainer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GoldTitleOfMainCard(title: title),
          Padding(
            padding: REdgeInsetsDirectional.only(
                bottom: verticalPadding, start: verticalPadding),
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
                itemBuilder: (context, index) {
                  Similars info = filmsSubInfoList[index];

                  return Padding(
                    padding: REdgeInsetsDirectional.only(
                        start: index == 0 ? horizontalPadding : 8,
                        end: index == 9 ? horizontalPadding : 0),
                    child: Center(
                        child: FilmCard(
                      filmId: info.id,
                      imageUrl: info.image,
                      imdbRating: info.imDbRating,
                      title: info.title,
                    )),
                  );
                },
                itemCount: filmsSubInfoList.length),
          ),
        ],
      ),
    );
  }
}
