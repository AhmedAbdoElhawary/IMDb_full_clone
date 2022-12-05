import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb/core/resources/color_manager.dart';
import 'package:imdb/core/resources/styles_manager.dart';
import 'package:imdb/core/utility/constant.dart';

class AppearancePage extends StatelessWidget {
  const AppearancePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.veryLowOpacityGrey2,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text("APPEARANCE", style: getLightStyle(fontSize: 13)),
            ),
            Container(
              color: ColorManager.white,
              padding: const EdgeInsets.all(horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text("App Theme"),
                      const RSizedBox(height: horizontalPadding),
                      Text("Experience IMDb in light or dark theme.",
                          style: getNormalStyle(
                              fontSize: 14, color: ColorManager.black54)),
                      const RSizedBox(height: horizontalPadding),
                      const _PopDisplaySettings()
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text("Video", style: getLightStyle(fontSize: 13)),
            ),
            Container(
              color: ColorManager.white,
              padding: const EdgeInsets.all(horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text("Auto-play video"),
                      const RSizedBox(height: horizontalPadding),
                      Text(
                          "Enable to automatically play video muted at the top of title and name pages",
                          style: getNormalStyle(
                              fontSize: 14, color: ColorManager.black54)),
                      const RSizedBox(height: horizontalPadding),
                      const _PopDisplaySettings()
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text("LOCALIZATION", style: getLightStyle(fontSize: 13)),
            ),
            Container(
              color: ColorManager.white,
              padding: const EdgeInsets.all(horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text("REGION"),
                      const RSizedBox(height: horizontalPadding),
                      Text(
                          "Enable to automatically play video muted at the top of title and name pages",
                          style: getNormalStyle(
                              fontSize: 14, color: ColorManager.black54)),
                      const RSizedBox(height: horizontalPadding),
                      const _PopDisplaySettings()
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Divider divider() => const Divider(color: ColorManager.grey, height: 1);

  Widget text(String text) {
    return Text(text, style: getNormalStyle(fontSize: 16));
  }
}

class _PopDisplaySettings extends StatefulWidget {
  const _PopDisplaySettings({
    Key? key,
  }) : super(key: key);

  @override
  State<_PopDisplaySettings> createState() => _PopDisplaySettingsState();
}

class _PopDisplaySettingsState extends State<_PopDisplaySettings> {
  String displayText = "Light";
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      tooltip: "Show profile menu",
      elevation: 10,
      constraints: const BoxConstraints(
          maxWidth: double.infinity, minWidth: double.infinity),
      color: ColorManager.veryLowOpacityGrey2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
      onSelected: (int item) => onSelectedProfileMenu(item),
      itemBuilder: (context) => profileItems(context),
      child: Row(
        children: [
          Text(
            displayText,
            style: getNormalStyle(fontSize: 16),
          ),
          const Spacer(),
          const Icon(Icons.arrow_drop_down_sharp)
        ],
      ),
    );
  }

  onSelectedProfileMenu(int item) {
    if (item == 0) {
      setState(() {
        displayText = "Light";
      });
    } else if (item == 1) {
      setState(() {
        displayText = "Dark";
      });
    }
  }

 
}
 List<PopupMenuEntry<int>> profileItems(BuildContext context) => [
        PopupMenuItem<int>(
          value: 0,
          child: Text(
            "Light",
            style: getNormalStyle(
                color: Theme.of(context).focusColor, fontSize: 15),
          ),
        ),
        PopupMenuItem<int>(
          value: 1,
          child: Text(
            "Dark",
            style: getNormalStyle(
                color: Theme.of(context).focusColor, fontSize: 15),
          ),
        ),
      ];