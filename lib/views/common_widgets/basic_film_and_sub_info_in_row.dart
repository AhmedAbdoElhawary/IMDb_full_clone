import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb/helper/resources/color_manager.dart';
import 'package:imdb/helper/resources/styles_manager.dart';
import 'package:imdb/helper/routes/route_app.dart';
import 'package:imdb/view_models/film/film_sub_details/film_sub_items.dart';
import 'package:imdb/views/pages/film_details/film_details_page.dart';
import 'package:imdb/views/pages/home/widgets/add_to_wach_list.dart';

class BasicFilmAndSubInfoInRow extends StatelessWidget {
  final bool makTextWhite;
  final double paddingInAll;
  final FilmSubItems? filmItems;
  const BasicFilmAndSubInfoInRow(
      {this.paddingInAll = 10,
      this.filmItems,
      this.makTextWhite = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(paddingInAll),
      child: GestureDetector(
        onTap: () {
          Go(context).to(const FilmDetailsPage());
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 130.h,
                  width: 90.w,
                  child:
                      Image.network(fit: BoxFit.cover, filmItems?.image ?? ""),
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
                  Text(
                    "${filmItems?.rank}. ${filmItems?.title ?? ""}",
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: getNormalStyle(
                        fontSize: makTextWhite ? 20 : 15,
                        color: makTextWhite
                            ? ColorManager.white
                            : ColorManager.black),
                  ),
                  const RSizedBox(height: 10),
                  Text(
                    "${filmItems?.year ?? ""}  2h 41m  PG-13",
                    style: getNormalStyle(
                        fontSize: 14,
                        color: makTextWhite
                            ? ColorManager.white
                            : ColorManager.black54),
                  ),
                  const RSizedBox(height: 5),
                  Flexible(
                    child: Padding(
                      padding: REdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.star,
                              color: ColorManager.blackYellow, size: 20),
                          Padding(
                            padding: REdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              filmItems?.imDbRating ?? "",
                              style: getNormalStyle(
                                  fontSize: 15,
                                  color: makTextWhite
                                      ? ColorManager.white
                                      : ColorManager.black),
                            ),
                          ),
                          const RSizedBox(width: 4),
                          // if (!makTextWhite)
                          // Container(
                          //   height: 20,
                          //   width: 20,
                          //   color: ColorManager.green,
                          //   child: Text(
                          //     filmItems?.imDbRatingCount ?? "",
                          //     style: getNormalStyle(
                          //         fontSize: 15,
                          //         color: makTextWhite
                          //             ? ColorManager.white
                          //             : ColorManager.black),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ),
                  // if (!makTextWhite)
                  //   Text(
                  //     "Watch options",
                  //     style: getNormalStyle(
                  //         fontSize: 16, color: ColorManager.blue),
                  //   ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
