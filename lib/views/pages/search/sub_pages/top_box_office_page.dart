import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb/helper/functions/network_exceptions.dart';
import 'package:imdb/helper/resources/color_manager.dart';
import 'package:imdb/helper/resources/styles_manager.dart';
import 'package:imdb/helper/routes/route_app.dart';
import 'package:imdb/view_models/box_office/box_office_details.dart';
import 'package:imdb/view_models/box_office/box_office_items.dart';
import 'package:imdb/views/bloc/box_office/box_office_cubit.dart';
import 'package:imdb/views/common_widgets/custom_circulars_progress.dart';
import 'package:imdb/views/common_widgets/network_image_display.dart';
import 'package:imdb/views/pages/details/film_details_page.dart';
import 'package:imdb/views/pages/home/widgets/add_to_wach_list.dart';

class TopBoxOfficePage extends StatelessWidget {
  const TopBoxOfficePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 56.h,
        title: Text("Top Box Office", style: getMediumStyle(fontSize: 22)),
      ),
      body: Center(
        child: BlocBuilder<BoxOfficeCubit, BoxOfficeState>(
          bloc: BoxOfficeCubit.get(context)..getBoxOffice(),
          buildWhen: (previous, current) => previous != current,
          builder: (context, BoxOfficeState state) {
            if (state is CubitBoxOfficeLoaded) {
              return TopBoxOfficeFiltered(boxOfficeDetails: state.details);
            } else if (state is CubitFailed) {
              return Text(NetworkExceptions.getErrorMessage(state.error));
            } else {
              return const CustomCircularProgress();
            }
          },
        ),
      ),
    );
  }
}

class TopBoxOfficeFiltered extends StatelessWidget {
  final BoxOfficeDetails? boxOfficeDetails;
  const TopBoxOfficeFiltered({super.key, this.boxOfficeDetails});

  @override
  Widget build(BuildContext context) {
    int lengthOfItem = boxOfficeDetails?.items?.length ?? 0;
    return ListView.separated(
        itemBuilder: (context, index) => index == 0
            ? _FilteredWidgets(lengthOfItem: lengthOfItem)
            : _BoxOfficeCard(
                boxOfficeItems: boxOfficeDetails?.items?[index - 1]),
        separatorBuilder: (context, index) => index == 0
            ? const SizedBox()
            : const Divider(color: ColorManager.grey, height: 1),
        itemCount: lengthOfItem + 1);
  }
}

class _FilteredWidgets extends StatelessWidget {
  final int lengthOfItem;

  const _FilteredWidgets({Key? key, required this.lengthOfItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(top: 10),
      child: Column(
        children: [
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("$lengthOfItem Results",
                          style: getNormalStyle(fontSize: 15)),
                      Text("Sorted by weekend gross",
                          style: getNormalStyle(
                              fontSize: 13, color: ColorManager.black54)),
                    ],
                  ),
                ),
                const Icon(Icons.sort, color: ColorManager.black54),
              ],
            ),
          ),
          const Divider(color: ColorManager.grey, thickness: 1.5, height: 1),
        ],
      ),
    );
  }
}

class _BoxOfficeCard extends StatelessWidget {
  final BoxOfficeItems? boxOfficeItems;
  const _BoxOfficeCard({required this.boxOfficeItems, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          String id = boxOfficeItems?.id ?? "";
          Go(context).to(FilmDetailsPage(filmId: id));
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
                  child: boxOfficeItems?.image == null
                      ? null
                      : NetworkImageDisplay(
                          fit: BoxFit.cover, boxOfficeItems!.image!),
                ),
                const Align(
                    alignment: Alignment.topLeft,
                    child: AddToWatchList(makeItSmaller: true)),
              ],
            ),
            const RSizedBox(width: 20),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    boxOfficeItems?.title ?? "",
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style:
                        getNormalStyle(fontSize: 18, color: ColorManager.black),
                  ),
                  const RSizedBox(height: 10),
                  Text(
                    "Weekend gross: ${boxOfficeItems?.weekend ?? ""}",
                    style: getNormalStyle(
                        fontSize: 15, color: ColorManager.black54),
                  ),
                  const RSizedBox(height: 5),
                  Text(
                    "Total gross: ${boxOfficeItems?.gross ?? ""}",
                    style: getNormalStyle(
                        fontSize: 15, color: ColorManager.black54),
                  ),
                  const RSizedBox(height: 5),
                  Text(
                    "Weeks since release: ${boxOfficeItems?.weeks ?? ""}",
                    style: getNormalStyle(
                        fontSize: 15, color: ColorManager.black54),
                  ),
                ],
              ),
            ),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 20),
              child: const Icon(Icons.airplane_ticket,
                  color: ColorManager.darkBlue),
            )
          ],
        ),
      ),
    );
  }
}
