import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb/helper/functions/network_exceptions.dart';
import 'package:imdb/helper/resources/color_manager.dart';
import 'package:imdb/helper/resources/styles_manager.dart';
import 'package:imdb/helper/utility/constant.dart';
import 'package:imdb/view_models/personal_info/personal_info_details.dart';
import 'package:imdb/views/bloc/personal_info/personal_info_cubit.dart';
import 'package:imdb/views/common_widgets/custom_circulars_progress.dart';
import 'package:imdb/views/common_widgets/floating_container.dart';
import 'package:imdb/views/common_widgets/gold_title_of_main_card.dart';
import 'package:imdb/views/pages/details/sub_pages/award_card.dart';
import 'package:imdb/views/pages/details/sub_pages/main_film_info_card.dart';
import 'package:imdb/views/pages/home/widgets/film_card.dart';

class ActorInfoPage extends StatefulWidget {
  final String actorId;
  const ActorInfoPage({required this.actorId, super.key});

  @override
  State<ActorInfoPage> createState() => _ActorInfoPageState();
}

class _ActorInfoPageState extends State<ActorInfoPage>
    with AutomaticKeepAliveClientMixin<ActorInfoPage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<PersonalInfoCubit, PersonalInfoState>(
      bloc: PersonalInfoCubit.get(context)
        ..getPersonalInfo(personalId: widget.actorId),
      buildWhen: (previous, current) =>
          previous != current && current is Success<PersonalInfoDetails>,
      builder: (context, PersonalInfoState state) {
        if (state is Success<PersonalInfoDetails>) {
          PersonalInfoDetails actorDetails = state.details;
          return Scaffold(
            backgroundColor: ColorManager.veryLowOpacityGrey2,
            appBar: appBar(actorDetails),
            body: ListView.separated(
                itemBuilder: (context, index) =>
                    listOfCards(actorDetails)[index],
                separatorBuilder: (context, index) =>
                    const RSizedBox(height: 20),
                itemCount: listOfCards(actorDetails).length),
          );
        } else if (state is PersonalFailed) {
          return Text(NetworkExceptions.getErrorMessage(state.error));
        } else {
          return const Scaffold(body: Center(child: CustomCircularProgress()));
        }
      },
    );
  }

  AppBar appBar(PersonalInfoDetails actorDetails) {
    return AppBar(
      title: Text(
        actorDetails.name,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
        style: getMediumStyle(fontSize: 20),
      ),
      actions: const [Icon(Icons.menu), RSizedBox(width: 15)],
    );
  }

  List<Widget> listOfCards(PersonalInfoDetails actorDetails) => [
        MainActorInfoCard(actorDetails: actorDetails),
        _MoreLikeThis(actorDetails: actorDetails),
        if (actorDetails.awards.isNotEmpty)
          AwardsCard(awards: actorDetails.awards),
        _DetailsCard(actorDetails: actorDetails),
        const RSizedBox(height: 0)
      ];

  @override
  bool get wantKeepAlive => true;
}

class _MoreLikeThis extends StatelessWidget {
  const _MoreLikeThis({required this.actorDetails});
  final PersonalInfoDetails actorDetails;
  @override
  Widget build(BuildContext context) {
    return FloatingContainer(
      height: -1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GoldTitleOfMainCard(title: "Filmography"),
          Padding(
            padding: REdgeInsets.symmetric(
                horizontal: horizontalPadding, vertical: 10),
            child: Text("KNOWN FOR",
                style:
                    getNormalStyle(fontSize: 13, color: ColorManager.black54)),
          ),
          Flexible(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  KnownFor info = actorDetails.knownFor[index];
                  return Padding(
                    padding: REdgeInsetsDirectional.only(
                        start: index == 0 ? horizontalPadding : 8,
                        end: index == 9 ? horizontalPadding : 0),
                    child: Center(
                        child: FilmCard(
                      id: info.id,
                      image: info.image,
                      year: info.year,
                      title: info.title,
                    )),
                  );
                },
                itemCount: actorDetails.knownFor.length),
          ),
        ],
      ),
    );
  }
}

class _DetailsCard extends StatelessWidget {
  const _DetailsCard({Key? key, required this.actorDetails}) : super(key: key);
  final PersonalInfoDetails actorDetails;
  @override
  Widget build(BuildContext context) {
    List<String> firstSplit = actorDetails.summary.split(" was born ");
    String birthName =
        firstSplit.isNotEmpty ? firstSplit[0] : "Robert Anthony De Niro jr.";
    List<String> secondSplit =
        firstSplit.length > 1 ? firstSplit[1].split(" in ") : [];
    String birthDate =
        secondSplit.isNotEmpty ? secondSplit[0] : "August 17, 1943" "";
    List<String> thirdSplit = secondSplit[1].split(", ");
    String birthLocation = thirdSplit.length > 2
        ? "${thirdSplit[0]}, ${thirdSplit[1]}, ${thirdSplit[2]}"
        : "";
    return FloatingContainer(
      height: -1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const GoldTitleOfMainCard(
              title: "Personal details", withoutSeeAll: true),
          const RSizedBox(height: 10),
          _TitleAndSubTitleTexts(
              title: "Born", subTitle: birthDate, thirdTitle: birthLocation),
          const Divider(color: ColorManager.grey),
          _TitleAndSubTitleTexts(title: "Birth name", subTitle: birthName),
          const Divider(color: ColorManager.grey),
          _TitleAndSubTitleTexts(
              title: "Height", subTitle: actorDetails.height),
          const RSizedBox(height: 10),
        ],
      ),
    );
  }
}

class _TitleAndSubTitleTexts extends StatelessWidget {
  final String title;
  final String subTitle;
  final String thirdTitle;

  const _TitleAndSubTitleTexts(
      {Key? key,
      this.title = "Metacritic",
      this.thirdTitle = "",
      this.subTitle = "4 wins & 16 nominations "})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: getNormalStyle(fontSize: 16)),
          const RSizedBox(height: 5),
          Text(subTitle,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
              style: getNormalStyle(fontSize: 15, color: ColorManager.black54)),
          if (thirdTitle.isNotEmpty)
            Text(thirdTitle,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
                style:
                    getNormalStyle(fontSize: 15, color: ColorManager.black54)),
        ],
      ),
    );
  }
}
