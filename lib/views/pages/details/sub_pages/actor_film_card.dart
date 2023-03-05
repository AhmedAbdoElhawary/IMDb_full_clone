import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb/helper/functions/network_exceptions.dart';
import 'package:imdb/helper/utility/constant.dart';
import 'package:imdb/view_models/personal_info/personal_info_details.dart';
import 'package:imdb/views/bloc/personal_info/personal_info_cubit.dart';
import 'package:imdb/views/common_widgets/custom_circulars_progress.dart';
import 'package:imdb/views/common_widgets/floating_container.dart';
import 'package:imdb/views/common_widgets/gold_title_of_main_card.dart';
import 'package:imdb/views/pages/home/widgets/film_card.dart';

class ActorFilmsCard extends StatelessWidget {
  final String title;
  const ActorFilmsCard(this.title, {super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    return FloatingContainer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GoldTitleOfMainCard(title: title),
          Flexible(
            child: BlocBuilder<PersonalInfoCubit, PersonalInfoState>(
              bloc: PersonalInfoCubit.get(context)
                ..getPersonalInfo(personalId: id),
              buildWhen: (previous, current) => previous != current,
              builder: (context, state) {
                if (state is Success<PersonalInfoDetails>) {
                  List<KnownFor> personalFilms = state.details.knownFor;
                  return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        KnownFor info = personalFilms[index];

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
                      itemCount: personalFilms.length);
                } else if (state is PersonalFailed) {
                  return Center(
                      child:
                          Text(NetworkExceptions.getErrorMessage(state.error)));
                } else {
                  return const CustomCircularProgress();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
