import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb/helper/resources/color_manager.dart';
import 'package:imdb/helper/resources/styles_manager.dart';
import 'package:imdb/helper/routes/route_app.dart';
import 'package:imdb/views/common_widgets/network_image_display.dart';
import 'package:imdb/views/pages/details/film_details_page.dart';
import 'package:imdb/views/pages/home/widgets/add_to_wach_list.dart';
import 'package:imdb/views/pages/home/widgets/film_card.dart';

class FilmSubInfoInRow extends StatelessWidget {
  final bool makTextWhite;
  final double paddingInAll;
  final String image;
  final String rankUpDown;
  final String rank;
  final String title;
  final String year;
  final String imDbRating;
  final String metacriticRating;
  final String releaseDate;
  final String id;

  const FilmSubInfoInRow(
      {this.paddingInAll = 10,
      this.makTextWhite = false,
      this.imDbRating = "",
      this.metacriticRating = "",
      this.image = imageUrl,
      this.rank = "",
      this.rankUpDown = "",
      this.releaseDate = "",
      this.title = "",
      this.year = "",
      required this.id,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(paddingInAll),
      child: InkWell(
        onTap: () {
          Go(context).to(FilmDetailsPage(filmId: id));
        },
        child: Container(
          color: ColorManager.transparent,
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 130.h,
                    width: 90.w,
                    child: image.isEmpty
                        ? null
                        : NetworkImageDisplay(fit: BoxFit.cover, image),
                  ),
                  const Align(
                      alignment: Alignment.topLeft,
                      child: AddToWatchList(makeItSmaller: true)),
                ],
              ),
              const RSizedBox(width: 10),
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (rankUpDown.isNotEmpty)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (rankUpDown[0] == "-") ...[
                            const Icon(Icons.arrow_drop_down_rounded,
                                color: ColorManager.red)
                          ] else ...[
                            const Icon(Icons.arrow_drop_up_rounded,
                                color: ColorManager.green)
                          ],
                          Text(rankUpDown.substring(1),
                              style: getNormalStyle(fontSize: 14)),
                        ],
                      ),
                    Text(
                      "${rank.isNotEmpty ? "$rank. " : ""}$title",
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: getNormalStyle(
                          fontSize: makTextWhite ? 20 : 18,
                          color: makTextWhite
                              ? ColorManager.white
                              : ColorManager.black),
                    ),
                    const RSizedBox(height: 6),
                    Text(
                      releaseDate.isEmpty ? year : releaseDate,
                      style: getNormalStyle(
                          fontSize: 15,
                          color: makTextWhite
                              ? ColorManager.white
                              : ColorManager.black54),
                    ),
                    const RSizedBox(height: 3),
                    Flexible(
                      child: Padding(
                        padding: REdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (imDbRating.isNotEmpty) ...[
                              const Icon(Icons.star,
                                  color: ColorManager.blackYellow, size: 18),
                              Padding(
                                padding: REdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  imDbRating,
                                  style: getNormalStyle(
                                      fontSize: 15,
                                      color: makTextWhite
                                          ? ColorManager.white
                                          : ColorManager.black),
                                ),
                              ),
                            ],
                            if (metacriticRating.isNotEmpty)
                              Container(
                                height: 20,
                                width: 20,
                                color: ColorManager.green,
                                child: Text(
                                  metacriticRating,
                                  style: getNormalStyle(
                                      fontSize: 15,
                                      color: makTextWhite
                                          ? ColorManager.white
                                          : ColorManager.black),
                                ),
                              )
                          ],
                        ),
                      ),
                    ),
                    if (releaseDate.isNotEmpty)
                      Text(
                        "In Theaters $releaseDate",
                        style: getNormalStyle(
                            fontSize: 18, color: ColorManager.blue),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
