import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb/helper/resources/color_manager.dart';
import 'package:imdb/helper/resources/styles_manager.dart';
import 'package:imdb/helper/routes/route_app.dart';
import 'package:imdb/views/common_widgets/box_shadows.dart';
import 'package:imdb/views/pages/film_details/film_details_page.dart';
import 'package:imdb/views/pages/home/widgets/add_to_wach_list.dart';

class FilmCard extends StatelessWidget {
  const FilmCard({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenHeightOver3 = screenHeight / 2.15;
    double horizontalPadding = 7.w;
    double verticalPadding = 7.h;

    return GestureDetector(
      onTap: () {
        Go(context).to(const FilmDetailsPage());
      },
      child: Container(
        height: screenHeightOver3,
        width: 150.w,
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: customBoxShadows(),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: screenHeightOver3 / 1.72,
                    width: double.infinity,
                    child: const StaticImage(),
                  ),
                  const Align(
                      alignment: Alignment.topLeft, child: AddToWatchList()),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(horizontalPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.star,
                            color: ColorManager.blackYellow, size: 18),
                        const SizedBox(width: 5),
                        Text("${5.7}", style: getNormalStyle(fontSize: 15)),
                      ],
                    ),
                    SizedBox(height: verticalPadding),
                    Text(
                      "The people We" * 5,
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: getNormalStyle(fontSize: 15),
                    ),
                    SizedBox(height: verticalPadding),
                    Text("2022  R  1h 39m",
                        style: getNormalStyle(
                            fontSize: 12, color: ColorManager.black54)),
                    SizedBox(height: horizontalPadding),
                    const _ShowTimeButton(),
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

const String imageUrl =
    "https://m.media-amazon.com/images/M/MV5BNTM4NjIxNmEtYWE5NS00NDczLTkyNWQtYThhNmQyZGQzMjM0XkEyXkFqcGdeQXVyODk4OTc3MTY@._V1_FMjpg_UX1000_.jpg";

class StaticImage extends StatelessWidget {
  const StaticImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network(fit: BoxFit.cover, imageUrl);
  }
}

class _ShowTimeButton extends StatelessWidget {
  const _ShowTimeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: outlinedStyle(),
      onPressed: () {},
      child: Text(
        "Show time",
        style: getNormalStyle(fontSize: 13, color: ColorManager.darkBlue),
      ),
    );
  }
}

ButtonStyle outlinedStyle() {
  return OutlinedButton.styleFrom(
    minimumSize: Size(double.infinity, 34.h),
    textStyle: getMediumStyle(fontSize: 17, color: ColorManager.blue),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
    side: const BorderSide(width: 0.5, color: ColorManager.black54),
  );
}
