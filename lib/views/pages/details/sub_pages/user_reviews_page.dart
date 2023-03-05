import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb/helper/resources/color_manager.dart';
import 'package:imdb/helper/resources/styles_manager.dart';
import 'package:imdb/helper/utility/constant.dart';
import 'package:imdb/view_models/film/reviews/reviews_details.dart';

class UserReviewsPage extends StatelessWidget {
  const UserReviewsPage(this.items, {super.key});
  final List<ReviewsItems> items;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.veryLowOpacityGrey2,
      appBar: AppBar(
        toolbarHeight: 56.h,
        title: Text("User reviews", style: getMediumStyle(fontSize: 22)),
      ),
      body: Stack(
        children: [
          ListView.separated(
              itemBuilder: (context, index) {
                return index == 0
                    ? _ResultFiltered(items.length)
                    : _BuildReviewText(items[index]);
              },
              separatorBuilder: (context, index) => index == 0
                  ? const SizedBox()
                  : const Divider(color: ColorManager.grey, height: 1),
              itemCount: items.length + 1),
        ],
      ),
    );
  }
}

class _BuildReviewText extends StatelessWidget {
  const _BuildReviewText(this.item, {Key? key}) : super(key: key);
  final ReviewsItems item;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> foldInfo = ValueNotifier(true);

    return ValueListenableBuilder(
      valueListenable: foldInfo,
      builder: (context, foldInfoValue, child) => GestureDetector(
        onTap: () {
          foldInfo.value = !foldInfoValue;
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: foldInfoValue ? 350 : null,
              padding: REdgeInsets.all(horizontalPadding),
              width: double.infinity,
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReviewContent(item),
                    if (!foldInfoValue) const RSizedBox(height: 60),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                if (foldInfoValue)
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          ColorManager.veryLowOpacityGrey2,
                          Color.fromARGB(101, 255, 255, 255),
                        ],
                      ),
                    ),
                    height: 60,
                    width: double.infinity,
                  ),
                _InteractionWidget(item),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewContent extends StatelessWidget {
  const ReviewContent(this.item, {Key? key}) : super(key: key);
  final ReviewsItems item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.star, color: ColorManager.darkBlue, size: 18),
            Text(item.rate, style: getMediumStyle(fontSize: 19)),
            Text("/10",
                style: getNormalStyle(fontSize: 16, color: ColorManager.grey)),
            const RSizedBox(width: 5),
            Flexible(
              child: Text(item.title,
                  softWrap: true,
                  overflow: TextOverflow.clip,
                  style: getNormalStyle(fontSize: 19)),
            ),
          ],
        ),
        const RSizedBox(height: 5),
        Text("${item.username}   ${item.date}",
            style: getNormalStyle(fontSize: 14, color: ColorManager.grey)),
        if (item.warningSpoilers) ...[
          const RSizedBox(height: 2),
          Text("WARNING: SPOILERS",
              style:
                  getNormalStyle(fontSize: 13, color: ColorManager.blackRed)),
        ],
        const RSizedBox(height: 5),
        Text(item.content,
            softWrap: true,
            overflow: TextOverflow.clip,
            style: getNormalStyle(fontSize: 15)),
      ],
    );
  }
}

class _InteractionWidget extends StatelessWidget {
  const _InteractionWidget(this.item, {Key? key}) : super(key: key);
  final ReviewsItems item;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.veryLowOpacityGrey2,
      child: Padding(
        padding:
            REdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.helpful,
              style: getNormalStyle(fontSize: 14, color: ColorManager.grey),
            ),
            const RSizedBox(height: 10),
            _InteractionButtons(item),
          ],
        ),
      ),
    );
  }
}

class _InteractionButtons extends StatefulWidget {
  const _InteractionButtons(this.item, {Key? key}) : super(key: key);
  final ReviewsItems item;

  @override
  State<_InteractionButtons> createState() => _InteractionButtonsState();
}

class _InteractionButtonsState extends State<_InteractionButtons> {
  bool? likeThisReview;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
            onTap: () {
              setState(() {
                if (likeThisReview == null || likeThisReview == false) {
                  likeThisReview = true;
                } else {
                  likeThisReview = null;
                }
              });
            },
            child: Icon(Icons.thumb_up,
                color: likeThisReview == true
                    ? ColorManager.blue
                    : ColorManager.darkGray)),
        const RSizedBox(width: 30),
        GestureDetector(
            onTap: () {
              setState(() {
                if (likeThisReview == null || likeThisReview == true) {
                  likeThisReview = false;
                } else {
                  likeThisReview = null;
                }
              });
            },
            child: Icon(Icons.thumb_down,
                color: likeThisReview == false
                    ? ColorManager.blue
                    : ColorManager.darkGray)),
        const Spacer(),
        const Icon(Icons.merge_outlined, color: ColorManager.darkGray)
      ],
    );
  }
}

class _ResultFiltered extends StatelessWidget {
  const _ResultFiltered(this.length, {Key? key}) : super(key: key);
  final int length;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const RSizedBox(height: 20),
        const Divider(color: ColorManager.grey),
        Padding(
          padding: REdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("$length Results",
                        style: getNormalStyle(fontSize: 15)),
                    Text("Sorted by featured",
                        style: getNormalStyle(
                            fontSize: 13, color: ColorManager.black54)),
                  ],
                ),
              ),
              const Icon(Icons.sort, color: ColorManager.black54),
            ],
          ),
        ),
        const RSizedBox(height: 10),
        const Divider(color: ColorManager.grey, thickness: 1.2, height: 1),
      ],
    );
  }
}
