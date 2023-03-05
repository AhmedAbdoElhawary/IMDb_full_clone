import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb/helper/resources/color_manager.dart';
import 'package:imdb/helper/resources/styles_manager.dart';
import 'package:imdb/helper/routes/route_app.dart';
import 'package:imdb/helper/utility/constant.dart';
import 'package:imdb/views/common_widgets/custom_elevated_button.dart';
import 'package:imdb/views/common_widgets/network_image_display.dart';
import 'package:imdb/views/pages/search/widgets/search_text_field.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.veryLowOpacityGrey2,
      appBar: appBar(context),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: const [
            _TapBar(),
            Flexible(
              child: TabBarView(
                children: [_RecentSearchesTap(), _AdvancedSearchTap()],
              ),
            ),
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
                const RSizedBox(width: horizontalPadding),
                const _CancelText(),
                const RSizedBox(width: horizontalPadding),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _AdvancedSearchTap extends StatelessWidget {
  const _AdvancedSearchTap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [_FiltersLists(), _SeeResultButton()],
    );
  }
}

class _SeeResultButton extends StatelessWidget {
  const _SeeResultButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.h,
      width: double.infinity,
      color: ColorManager.lightBlack87,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const RSizedBox(width: 20),
          InkWell(
            onTap: () {},
            child: Text(
              "CLEAR",
              style: getMediumStyle(
                  fontSize: 15, color: ColorManager.shimmerDarkGrey),
            ),
          ),
          Flexible(
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 20),
              child: CustomElevatedButton(
                  backgroundColor: ColorManager.blackYellow,
                  withoutPadding: true,
                  child:
                      Text("SEE RESULT", style: getMediumStyle(fontSize: 15)),
                  onPressed: () {}),
            ),
          ),
        ],
      ),
    );
  }
}

class _FiltersLists extends StatelessWidget {
  const _FiltersLists({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: REdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                ...List.generate(
                  10,
                  (index) => Padding(
                    padding: REdgeInsets.only(top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: REdgeInsets.symmetric(
                              horizontal: horizontalPadding),
                          child: Text("Title Type",
                              style: getNormalStyle(fontSize: 17)),
                        ),
                        const RSizedBox(height: 10),
                        SizedBox(
                          height: 35.h,
                          child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => Padding(
                                    padding: REdgeInsetsDirectional.only(
                                        start:
                                            index == 0 ? horizontalPadding : 0,
                                        end: index == 19
                                            ? horizontalPadding
                                            : 0),
                                    child: const _BuildSearchContainer(),
                                  ),
                              separatorBuilder: (context, index) =>
                                  const RSizedBox(width: 10),
                              itemCount: 20),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BuildSearchContainer extends StatefulWidget {
  const _BuildSearchContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<_BuildSearchContainer> createState() => _BuildSearchContainerState();
}

class _BuildSearchContainerState extends State<_BuildSearchContainer> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Container(
          decoration: BoxDecoration(
              color: selected
                  ? ColorManager.blackYellow
                  : ColorManager.light2Black87,
              borderRadius: BorderRadius.circular(3)),
          padding: REdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: Text(
              "Movie",
              style: getMediumStyle(
                  fontSize: 15,
                  color: selected ? ColorManager.black : ColorManager.white),
            ),
          )),
    );
  }
}

class _RecentSearchesTap extends StatelessWidget {
  const _RecentSearchesTap({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const _RecentSearchesTexts(),
      const RSizedBox(height: 10),
      Flexible(
        child: ListView.separated(
            itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 85.h,
                        width: 55.w,
                        child: const NetworkImageDisplay(
                          "https://cdn.britannica.com/65/227665-050-D74A477E/American-actor-Leonardo-DiCaprio-2016.jpg",
                          fit: BoxFit.cover
                        ),
                      ),
                      const RSizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Leonardo DiCaprio",
                              style: getNormalStyle(fontSize: 16)),

                          /// for tv and movie
                          //  Text("2010-2023 TV Series",
                          // style: getNormalStyle(
                          //     fontSize: 16,
                          //     color: ColorManager.black54)),

                          Text("Actor, inception (2010)",
                              style: getNormalStyle(
                                  fontSize: 16, color: ColorManager.black54)),
                        ],
                      ),
                    ],
                  ),
                ),
            separatorBuilder: (context, index) => const Divider(
                  color: ColorManager.grey,
                ),
            itemCount: 10),
      ),
    ]);
  }
}

class _RecentSearchesTexts extends StatelessWidget {
  const _RecentSearchesTexts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(horizontalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Recent Searches", style: getNormalStyle(fontSize: 17)),
          GestureDetector(
            onTap: () {},
            child: Text("CLEAR",
                style:
                    getMediumStyle(fontSize: 15, color: ColorManager.darkBlue)),
          )
        ],
      ),
    );
  }
}

class _TapBar extends StatelessWidget {
  const _TapBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.veryLowOpacityGrey2,
        boxShadow: [
          BoxShadow(
            color: ColorManager.grey.withOpacity(.55),
            spreadRadius: 0.5,
            blurRadius: 0.5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: TabBar(
        unselectedLabelStyle: getMediumStyle(fontSize: 14),
        labelStyle: getMediumStyle(fontSize: 14),
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
            border: Border(
                bottom:
                    BorderSide(color: ColorManager.blackYellow, width: 1.8.w))),
        unselectedLabelColor: ColorManager.black54,
        tabs: const [
          Tab(child: Text("RECENT")),
          Tab(child: Text("ADVANCED SEARCH")),
        ],
      ),
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
      width: 35.w,
      padding: REdgeInsets.symmetric(vertical: 5),
      decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(color: ColorManager.grey, width: 0.7))),
      child: const Icon(Icons.mic),
    );
  }
}
