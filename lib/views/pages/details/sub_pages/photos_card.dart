import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb/helper/utility/constant.dart';
import 'package:imdb/view_models/film/film_details/film_details.dart';
import 'package:imdb/view_models/film/image/image_details.dart';
import 'package:imdb/views/common_widgets/box_shadows.dart';
import 'package:imdb/views/common_widgets/floating_container.dart';
import 'package:imdb/views/common_widgets/gold_title_of_main_card.dart';
import 'package:imdb/views/common_widgets/network_image_display.dart';

class PhotosCard extends StatelessWidget {
  const PhotosCard({Key? key, required this.filmDetails}) : super(key: key);
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
                            child: NetworkImageDisplay(imageUrl,
                                fit: BoxFit.cover)),
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
