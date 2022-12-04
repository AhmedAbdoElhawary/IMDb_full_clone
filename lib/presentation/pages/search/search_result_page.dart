import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb/core/resources/color_manager.dart';
import 'package:imdb/core/resources/styles_manager.dart';
import 'package:imdb/presentation/common/widgets/text_field/custom_text_field.dart';

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
              getNormalStyle(color: ColorManager.black54, fontSize: 15),
          labelStyle: getNormalStyle(fontSize: 15),
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
      actions: [
        Flexible(
          child: SizedBox(
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: REdgeInsets.symmetric(horizontal: 15),
                  child: const Icon(Icons.search),
                ),
                Flexible(
                    child: CustomTextField(
                  controller: TextEditingController(),
                  hint: "Search IMDb",
                  enable: true,
                )),
                const Icon(Icons.mic),
                const RSizedBox(width: 20),
                Text(
                  "CANCEL",
                  style: getNormalStyle(
                      fontSize: 15, color: ColorManager.darkBlue),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
