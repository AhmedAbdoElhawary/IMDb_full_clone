import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb/helper/resources/color_manager.dart';
import 'package:imdb/helper/resources/styles_manager.dart';
import 'package:imdb/helper/utility/constant.dart';
import 'package:imdb/views/common_widgets/film_sub_info_in_row.dart';
import 'package:imdb/views/common_widgets/network_image_display.dart';
import 'package:imdb/views/common_widgets/play_icon_with_time.dart';
import 'package:imdb/views/pages/home/widgets/film_card.dart';

class VideoWatchPage extends StatefulWidget {
  const VideoWatchPage({super.key});

  @override
  State<VideoWatchPage> createState() => _VideoWatchPageState();
}

class _VideoWatchPageState extends State<VideoWatchPage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;

    return Scaffold(
      backgroundColor: ColorManager.black,
      body: SafeArea(
        child: Column(
          children: [
            Container(
                height: screenHeight / 3.65,
                width: double.infinity,
                color: ColorManager.black),
            Flexible(
                child: ListView.separated(
                    itemBuilder: (context, index) => index == 0
                        ? const _FoldContainers()
                        : const _VideosOfPlayList(),
                    separatorBuilder: (context, index) =>
                        const RSizedBox(height: 1),
                    itemCount: 30))
          ],
        ),
      ),
    );
  }
}

class _FoldContainers extends StatefulWidget {
  const _FoldContainers({Key? key}) : super(key: key);

  @override
  State<_FoldContainers> createState() => _FoldContainersState();
}

class _FoldContainersState extends State<_FoldContainers> {
  bool foldInfo = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() => foldInfo = !foldInfo);
          },
          child: _NowPlayingText(foldInfo: foldInfo),
        ),
        GestureDetector(
          onTap: () {
            setState(() => foldInfo = !foldInfo);
          },
          child: _FilmSubInfoFolded(foldInfo: foldInfo),
        ),
        const _PlayListText(),
      ],
    );
  }
}

class _VideosOfPlayList extends StatelessWidget {
  const _VideosOfPlayList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: REdgeInsets.only(
            top: horizontalPadding,
            left: horizontalPadding,
            right: horizontalPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                SizedBox(
                  height: 105.h,
                  width: 160.w,
                  child: ShaderMask(
                    shaderCallback: (bounds) {
                      return const LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        stops: [0.005, 0.2],
                        colors: [
                          ColorManager.darkGray,
                          ColorManager.transparent,
                        ],
                      ).createShader(bounds);
                    },
                    blendMode: BlendMode.dstOut,
                    child:
                        const NetworkImageDisplay(imageUrl, fit: BoxFit.cover),
                  ),
                ),
                Padding(
                    padding:
                        REdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: const PlayIconWithTime()),
              ],
            ),
            const RSizedBox(width: 10),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Black Panther: Wakanda Forever " * 3,
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style:
                        getNormalStyle(fontSize: 15, color: ColorManager.white),
                  ),
                  const RSizedBox(height: 10),
                  Text(
                    "Official Trailer",
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style:
                        getNormalStyle(fontSize: 15, color: ColorManager.grey),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _NowPlayingText extends StatelessWidget {
  const _NowPlayingText({Key? key, required this.foldInfo}) : super(key: key);

  final bool foldInfo;

  @override
  Widget build(BuildContext context) {
    return _LightContainerForTitle(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "NOW PLAYING",
            style: getMediumStyle(fontSize: 15, color: ColorManager.white),
          ),
          Icon(foldInfo ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: ColorManager.white)
        ],
      ),
    );
  }
}

class _PlayListText extends StatelessWidget {
  const _PlayListText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _LightContainerForTitle(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "PLAYLIST",
          style: getMediumStyle(fontSize: 15, color: ColorManager.white),
        ),
      ),
    );
  }
}

class _LightContainerForTitle extends StatelessWidget {
  const _LightContainerForTitle({Key? key, required this.child})
      : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(horizontal: horizontalPadding),
      height: 50.h,
      width: double.infinity,
      color: ColorManager.black87,
      child: Padding(
        padding: REdgeInsets.symmetric(vertical: 10),
        child: child,
      ),
    );
  }
}

class _FilmSubInfoFolded extends StatelessWidget {
  const _FilmSubInfoFolded({Key? key, required this.foldInfo})
      : super(key: key);

  final bool foldInfo;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: foldInfo ? 150 : null,
          padding: REdgeInsets.all(horizontalPadding),
          width: double.infinity,
          color: const Color.fromARGB(255, 29, 29, 29),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\"Time\" TV Spot",
                  style:
                      getNormalStyle(fontSize: 16, color: ColorManager.white),
                ),
                const RSizedBox(height: 5),
                Text(
                  "The nation of Wakanda is pitted against intervening " * 3,
                  softWrap: true,
                  maxLines: foldInfo ? 1 : 50,
                  overflow: TextOverflow.ellipsis,
                  style: getNormalStyle(fontSize: 15, color: ColorManager.grey),
                ),
                const RSizedBox(height: horizontalPadding),
                const FilmSubInfoInRow(
                    id: "", makTextWhite: true, paddingInAll: 0),
                const RSizedBox(height: horizontalPadding),
                SizedBox(
                  height: 45.h,
                  child: Scrollbar(
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Row(
                              children: [
                                const CircleAvatar(
                                  radius: 25,
                                  backgroundColor: ColorManager.darkGray,
                                  backgroundImage:
                                      CachedNetworkImageProvider(imageUrl),
                                ),
                                const RSizedBox(width: 5),
                                Text(
                                  "Ahmed Abdo",
                                  softWrap: true,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: getNormalStyle(
                                      fontSize: 14, color: ColorManager.white),
                                )
                              ],
                            ),
                        separatorBuilder: (context, index) =>
                            const RSizedBox(width: 10),
                        itemCount: 10),
                  ),
                )
              ],
            ),
          ),
        ),
        if (foldInfo)
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [ColorManager.black, ColorManager.transparent],
              ),
            ),
            height: 100,
            width: double.infinity,
          ),
      ],
    );
  }
}
