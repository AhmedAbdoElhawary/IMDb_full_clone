import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb/core/resources/color_manager.dart';
import 'package:imdb/core/resources/styles_manager.dart';
import 'package:imdb/presentation/common/widgets/box_shadows.dart';
import 'package:imdb/presentation/common/widgets/custom_elevated_button.dart';
import 'package:imdb/presentation/common/widgets/custom_outlined_button.dart';
import 'package:imdb/presentation/common/widgets/films_main_floating_container.dart';
import 'package:imdb/presentation/common/widgets/floating_container.dart';
import 'package:imdb/presentation/common/widgets/gold_title_of_main_card.dart';
import 'package:imdb/presentation/pages/home/widgets/actor_birth_day_card.dart';
import 'package:imdb/presentation/pages/home/widgets/film_card.dart';

const double _horizontalPadding = 15;

class FilmDetailsPage extends StatelessWidget {
  const FilmDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorManager.veryLowOpacityGrey2,
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _MainFilmInfoCard(),
            const RSizedBox(height: 20),
            _CastInfo(screenHeight: screenHeight),
            const RSizedBox(height: 20),
            const FilmsMainCard("More like this"),
            const RSizedBox(height: 20),
            const _VideosCard(),
            const RSizedBox(height: 20),
            const _PhotosCard(),
            const RSizedBox(height: 20),
            const _AwardsCard(),
            const RSizedBox(height: 20),
            const _UserReviews(),
            const RSizedBox(height: 20),
            const _CriticReviews(),
            const RSizedBox(height: 20),
            const _GuideOfParents(),
            const RSizedBox(height: 20),
            const _DidYouKnow(),
            const RSizedBox(height: 20),
            const FilmsMainCard("More drama picks"),
            const RSizedBox(height: 20),
            const FilmsMainCard("More from Tom Cruise (Actor)"),
            const RSizedBox(height: 20),
            const FilmsMainCard("More from Joseph Kosinski (Director)"),
            const RSizedBox(height: 1000),
          ],
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      elevation: 4,
      title: Text(
        "Top Gun: Maverick",
        softWrap: true,
        overflow: TextOverflow.ellipsis,
        style: getMediumStyle(fontSize: 20),
      ),
      actions: const [Icon(Icons.menu), RSizedBox(width: 15)],
    );
  }
}

class _CastInfo extends StatelessWidget {
  const _CastInfo({Key? key, required this.screenHeight}) : super(key: key);

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return FloatingContainer(
      height: screenHeight / 1.32,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GoldTitleOfMainCard(title: "Cast"),
          Padding(
            padding: REdgeInsets.symmetric(
                horizontal: _horizontalPadding, vertical: 10),
            child: Text("TOP BILLED CAST",
                style:
                    getNormalStyle(fontSize: 13, color: ColorManager.black54)),
          ),
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
          Padding(
            padding: REdgeInsets.all(_horizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Director", style: getNormalStyle(fontSize: 17)),
                Text("Joseph Kosinski",
                    style: getNormalStyle(
                        fontSize: 14, color: ColorManager.black54)),
                const RSizedBox(height: 20),
                Text("Writers", style: getNormalStyle(fontSize: 17)),
                Text("Joseph Kosinski" * 10,
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: getNormalStyle(
                        fontSize: 14, color: ColorManager.black54)),
                const RSizedBox(height: 30),
                Text("ALL CAST & CREW",
                    style: getMediumStyle(
                        fontSize: 15, color: ColorManager.darkBlue)),
              ],
            ),
          ),
        ],
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
      height: screenHeight / 1.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GoldTitleOfMainCard(title: "Videos"),
          const RSizedBox(height: 30),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: _horizontalPadding),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Container(
                  height: 210.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: ColorManager.teal,
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: customBoxShadows()),
                ),
                Padding(
                    padding: REdgeInsets.all(15.0), child: const _PlayIcon()),
              ],
            ),
          ),
          Padding(
            padding: REdgeInsets.symmetric(
                horizontal: _horizontalPadding, vertical: _horizontalPadding),
            child:
                Text("Official Trailer 2", style: getNormalStyle(fontSize: 16)),
          ),
          Flexible(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                    padding: REdgeInsetsDirectional.only(
                        start: index == 0 ? _horizontalPadding : 10,
                        end: index == 9 ? _horizontalPadding : 0),
                    child: const Center(child: _ThumbnailTrailerCard())),
                itemCount: 10),
          ),
        ],
      ),
    );
  }
}

class _PhotosCard extends StatelessWidget {
  const _PhotosCard();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;
    double screenWidth = screenSize.width;

    return FloatingContainer(
      height: screenHeight / 2.95,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GoldTitleOfMainCard(title: "Photos"),
          Flexible(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                      padding: REdgeInsetsDirectional.only(
                          start: index == 0 ? _horizontalPadding : 10,
                          end: index == 9 ? _horizontalPadding : 0),
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

class _ThumbnailTrailerCard extends StatelessWidget {
  const _ThumbnailTrailerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      width: 140.w,
      decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: customBoxShadows()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 90.h,
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                const SizedBox(width: double.infinity, child: StaticImage()),
                Padding(
                    padding: REdgeInsets.all(5.0), child: const _PlayIcon()),
              ],
            ),
          ),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 10, vertical: 7),
            child: Text(
              "Big Game Spot " * 5,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: getNormalStyle(fontSize: 13),
            ),
          )
        ],
      ),
    );
  }
}

class _AwardsCard extends StatelessWidget {
  const _AwardsCard();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;

    return FloatingContainer(
      height: screenHeight / 4.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GoldTitleOfMainCard(title: "Awards"),
          const RSizedBox(height: 10),
          Padding(
            padding: REdgeInsets.symmetric(
                horizontal: _horizontalPadding, vertical: 20),
            child:
                Text("Top 250 movies #82", style: getNormalStyle(fontSize: 17)),
          ),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: _horizontalPadding),
            child: Text("4 wins & 16 nominations",
                style: getNormalStyle(fontSize: 17)),
          ),
        ],
      ),
    );
  }
}

class _UserReviews extends StatelessWidget {
  const _UserReviews();

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
            padding: const EdgeInsets.symmetric(horizontal: _horizontalPadding),
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
                                  text: "8.4",
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
            padding: REdgeInsets.all(_horizontalPadding),
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
            padding: REdgeInsets.symmetric(horizontal: _horizontalPadding),
            child:
                Text("Featured Reviews", style: getNormalStyle(fontSize: 17)),
          ),
          Flexible(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                      padding: REdgeInsetsDirectional.only(
                          start: index == 0 ? _horizontalPadding : 10,
                          end: index == 9 ? _horizontalPadding : 0),
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
  const _CriticReviews();

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
            padding: REdgeInsets.symmetric(horizontal: _horizontalPadding),
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
  const _GuideOfParents();

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
                horizontal: _horizontalPadding, vertical: 20),
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
  const _DidYouKnow();

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
                          REdgeInsets.symmetric(horizontal: _horizontalPadding),
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

          // const Divider(color: ColorManager.grey),
        ],
      ),
    );
  }
}

class _PlayIcon extends StatelessWidget {
  const _PlayIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.play_circle_outline,
          color: ColorManager.white,
          size: 25,
        ),
        const RSizedBox(width: 5),
        Text(
          "Trailer 0:29",
          style: getNormalStyle(
            fontSize: 15,
            color: ColorManager.white,
          ),
        )
      ],
    );
  }
}

class _MainFilmInfoCard extends StatelessWidget {
  const _MainFilmInfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return FloatingContainer(
      height: screenHeight / 1.175,
      child: Padding(
        padding: REdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            _FilmTitleAndSubNumbersInfo(),
            FilmTrailerPreview(),
            _PosterAndSubInfo(),
            _AddToWatchListButton(),
            RSizedBox(height: 5),
            Divider(color: ColorManager.grey),
            _ScoresWidgets(),
          ],
        ),
      ),
    );
  }
}

class _ScoresWidgets extends StatelessWidget {
  const _ScoresWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [_RatingInfo(), _RateThis(), _Metascore()],
    );
  }
}

class _Metascore extends StatelessWidget {
  const _Metascore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(Icons.square, color: ColorManager.green, size: 30),
        Text("Metascore", style: getNormalStyle(fontSize: 13)),
        Text("63 critics",
            style: getNormalStyle(fontSize: 13, color: ColorManager.grey))
      ],
    );
  }
}

class _RateThis extends StatelessWidget {
  const _RateThis({
    Key? key,
  }) : super(key: key);

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
  const _RatingInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(Icons.star, color: ColorManager.blackYellow, size: 30),
        Text.rich(
          TextSpan(
            children: <TextSpan>[
              TextSpan(text: "8.4", style: getBoldStyle(fontSize: 20)),
              TextSpan(
                style: getNormalStyle(fontSize: 15),
                text: "/10",
              )
            ],
          ),
        ),
        Text("436,655",
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
          REdgeInsets.symmetric(horizontal: _horizontalPadding, vertical: 7.5),
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
  const _PosterAndSubInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          REdgeInsets.symmetric(horizontal: _horizontalPadding, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 108.w,
            height: 160.h,
            color: ColorManager.blackYellow,
          ),
          const RSizedBox(width: _horizontalPadding),
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
                      itemBuilder: (context, index) => Container(
                            padding: REdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: ColorManager.grey, width: 1)),
                            child: Center(
                              child: Text(
                                "Action",
                                style: getNormalStyle(fontSize: 15),
                              ),
                            ),
                          ),
                      separatorBuilder: (context, index) =>
                          const RSizedBox(width: 8),
                      itemCount: 10),
                ),
                const RSizedBox(height: 15),
                Text(
                  "After thirty years" * 10,
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

class FilmTrailerPreview extends StatelessWidget {
  const FilmTrailerPreview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.teal,
      width: double.infinity,
      height: 225.h,
    );
  }
}

class _FilmTitleAndSubNumbersInfo extends StatelessWidget {
  const _FilmTitleAndSubNumbersInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: REdgeInsets.symmetric(horizontal: _horizontalPadding),
        child: Text(
          "Top Gun: Maverick",
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          style: getNormalStyle(fontSize: 35),
        ),
      ),
      Padding(
        padding:
            REdgeInsets.symmetric(horizontal: _horizontalPadding, vertical: 5),
        child: Text(
          "2022  PG-13  2h 10m",
          style: getNormalStyle(fontSize: 15, color: ColorManager.grey),
        ),
      ),
    ]);
  }
}
