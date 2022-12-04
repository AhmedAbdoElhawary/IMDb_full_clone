import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb/config/routes/route_app.dart';
import 'package:imdb/core/resources/color_manager.dart';
import 'package:imdb/core/resources/styles_manager.dart';
import 'package:imdb/presentation/pages/search/widgets/search_text_field.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: DefaultTabController(
        length: 2,
        child: TabBar(
          unselectedLabelStyle:
              getNormalStyle(color: ColorManager.black87, fontSize: 15),
          labelStyle: getNormalStyle(fontSize: 15),
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: ColorManager.blackYellow,
          tabs: const [
            Tab(child: Text("RECENT")),
            Tab(child: Text("ADVANCED SEARCH")),
          ],
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      actions: [
        Flexible(
          child: SizedBox(
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const _SearchIcon(),
                Flexible(
                  child: SearchTextField(
                    controller: TextEditingController(),
                    hint: "Search IMDb",
                    enable: true,
                  ),
                ),
                const _MicIcon(),
                const RSizedBox(width: 20),
                const _CancelText(),
                const RSizedBox(width: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _SearchIcon extends StatelessWidget {
  const _SearchIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 15),
      child: const Icon(Icons.search),
    );
  }
}

class _CancelText extends StatelessWidget {
  const _CancelText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Go(context).back();
      },
      child: Text(
        "CANCEL",
        style: getMediumStyle(fontSize: 15, color: ColorManager.darkBlue),
      ),
    );
  }
}

class _MicIcon extends StatelessWidget {
  const _MicIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(2),
      decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(color: ColorManager.grey, width: 0.7))),
      child: const Icon(Icons.mic),
    );
  }
}
