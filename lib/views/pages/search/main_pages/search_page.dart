import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb/helper/resources/color_manager.dart';
import 'package:imdb/helper/resources/styles_manager.dart';
import 'package:imdb/helper/routes/route_app.dart';
import 'package:imdb/helper/utility/constant.dart';
import 'package:imdb/views/common_widgets/box_shadows.dart';
import 'package:imdb/views/pages/home/widgets/film_card.dart';
import 'package:imdb/views/pages/search/main_pages/search_result_page.dart';
import 'package:imdb/views/pages/search/sub_pages/coming_soon_page.dart';
import 'package:imdb/views/pages/search/sub_pages/most_popular_movies_page.dart';
import 'package:imdb/views/pages/search/sub_pages/top_250_movies_page.dart';
import 'package:imdb/views/pages/search/sub_pages/top_box_office_page.dart';
import 'package:imdb/views/pages/search/widgets/search_text_field.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.veryLowOpacityGrey2,
      appBar: appBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: const [
                    _RecentTexts(),
                    _RecentlyVisited(),
                    _MoviesText(icon: Icons.movie, title: "Movies"),
                  ],
                ),
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                spacing: 25,
                runSpacing: 20,
                children: [
                  ...List.generate(
                      10,
                      (index) =>
                          _ThumbnailTrailerCard(card: movieCards[index])),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: _MoviesText(icon: Icons.tv, title: "Streaming & TV"),
              ),
              // Wrap(
              //   crossAxisAlignment: WrapCrossAlignment.start,
              //   spacing: 25,
              //   runSpacing: 20,
              //   children: [
              //     ...List.generate(7,
              //         (index) => _ThumbnailTrailerCard(title: titles()[index])),
              //   ],
              // ),
              // const Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 20),
              //   child: _MoviesText(icon: Icons.person, title: "Celebs"),
              // ),
              // Wrap(
              //   crossAxisAlignment: WrapCrossAlignment.start,
              //   spacing: 25,
              //   runSpacing: 20,
              //   children: [
              //     ...List.generate(3,
              //         (index) => _ThumbnailTrailerCard(title: titles()[index])),
              //   ],
              // ),
              // const Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 20),
              //   child: _MoviesText(
              //       icon: Icons.stars_rounded, title: "Awards & Events"),
              // ),
              // Wrap(
              //   crossAxisAlignment: WrapCrossAlignment.start,
              //   spacing: 25,
              //   runSpacing: 20,
              //   children: [
              //     ...List.generate(3,
              //         (index) => _ThumbnailTrailerCard(title: titles()[index])),
              //   ],
              // ),
              // const RSizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      actions: [
        Flexible(
          child: SizedBox(
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: REdgeInsets.symmetric(horizontal: 15),
                  child: const Icon(Icons.search),
                ),
                Flexible(
                    child: GestureDetector(
                  onTap: () {
                    Go(context).to(const SearchResultPage());
                  },
                  child: SearchTextField(
                    controller: TextEditingController(),
                    hint: "Search IMDb",
                    enable: false,
                  ),
                )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _MoviesText extends StatelessWidget {
  final String title;
  final IconData icon;
  const _MoviesText({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(top: 30, bottom: horizontalPadding),
      child: Row(
        children: [
          Icon(icon, color: ColorManager.blackYellow, size: 33),
          const RSizedBox(width: 20),
          Expanded(child: Text(title, style: getBoldStyle(fontSize: 22))),
        ],
      ),
    );
  }
}

class _RecentTexts extends StatelessWidget {
  const _RecentTexts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(top: horizontalPadding, bottom: 10),
      child: Row(
        children: [
          const Icon(Icons.access_time_outlined,
              color: ColorManager.blackYellow, size: 33),
          const RSizedBox(width: 20),
          Expanded(child: Text("Recent", style: getBoldStyle(fontSize: 22))),
          Text("CLEAR",
              style: getMediumStyle(fontSize: 15, color: ColorManager.darkBlue))
        ],
      ),
    );
  }
}

class _RecentlyVisited extends StatelessWidget {
  const _RecentlyVisited({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      child: Scrollbar(
        child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
                  padding:
                      REdgeInsetsDirectional.only(start: index == 0 ? 5 : 0),
                  child:
                      Center(child: _ThumbnailTrailerCard(card: movieCards[0])),
                ),
            separatorBuilder: (context, index) => const RSizedBox(width: 25),
            itemCount: 5),
      ),
    );
  }
}

class _ThumbnailTrailerCard extends StatelessWidget {
  final Map<String, dynamic> card;
  const _ThumbnailTrailerCard({Key? key, required this.card}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Go(context).to(card["page"]);
      },
      child: Container(
        height: 165.h,
        width: 160.w,
        padding: REdgeInsets.all(8),
        decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(7.r),
            boxShadow: customBoxShadows()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 100.h,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(7.r),
                  child: const StaticImage()),
            ),
            SizedBox(
              height: 48.h,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  card["title"],
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: getNormalStyle(fontSize: 15),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> movieCards = [
  {"title": "Popular movie trailers", "page": const Top250MoviesPage()},
  {"title": "Recent movie trailers", "page": const Top250MoviesPage()},
  {"title": "Movie showtimes", "page": const Top250MoviesPage()},
  {"title": "Top box office", "page": const TopBoxOfficePage()},
  {"title": "Top 250 movies", "page": const Top250MoviesPage()},
  {"title": "Most popular movies", "page": const MostPopularMoviesPage()},
  {"title": "Coming soon to theaters", "page": const ComingSoonPage()},
  {"title": "Most popular movies by genre", "page": const Top250MoviesPage()},
  {"title": "Best picture winners", "page": const Top250MoviesPage()},
  {"title": "Movie news", "page": const Top250MoviesPage()},
];
