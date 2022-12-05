import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb/config/routes/route_app.dart';
import 'package:imdb/core/resources/color_manager.dart';
import 'package:imdb/core/resources/styles_manager.dart';
import 'package:imdb/core/utility/constant.dart';
import 'package:imdb/presentation/common/widgets/films_main_floating_container.dart';
import 'package:imdb/presentation/common/widgets/floating_container.dart';
import 'package:imdb/presentation/common/widgets/gold_title_of_main_card.dart';
import 'package:imdb/presentation/pages/home/widgets/actor_birth_day_card.dart';
import 'package:imdb/presentation/pages/personal/settings_page.dart';

class PersonalPage extends StatelessWidget {
  const PersonalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.veryLowOpacityGrey2,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  const RSizedBox(width: 15),
                  const Icon(Icons.person_pin,
                      color: ColorManager.blackYellow, size: 25),
                  const RSizedBox(width: 15),
                  Text("ahmed", style: getMediumStyle(fontSize: 19)),
                  const Spacer(),
                  Padding(
                    padding: REdgeInsets.all(15.0),
                    child: GestureDetector(
                        onTap: () {
                          Go(context).to(const SettingsPage());
                        },
                        child: const Icon(Icons.settings)),
                  ),
                ],
              ),
              const RSizedBox(height: 10),
              const FilmsMainCard("Your watchlist"),
              const RSizedBox(height: 20),
              const _BornTodayMainCard(),
              const RSizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _BornTodayMainCard extends StatelessWidget {
  const _BornTodayMainCard();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return FloatingContainer(
      height: screenHeight / 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GoldTitleOfMainCard(
              title: "Recently viewed", withoutVerticalPadding: true),
          Flexible(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                      padding: REdgeInsetsDirectional.only(
                          start: index == 0 ? horizontalPadding : 8,
                          end: index == 9 ? horizontalPadding : 0),
                      child: const Center(child: ActorBirthdayCard()),
                    ),
                itemCount: 10),
          ),
        ],
      ),
    );
  }
}
