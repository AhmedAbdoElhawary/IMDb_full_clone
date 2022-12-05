import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb/config/routes/route_app.dart';
import 'package:imdb/core/resources/color_manager.dart';
import 'package:imdb/core/resources/styles_manager.dart';
import 'package:imdb/core/utility/constant.dart';
import 'package:imdb/presentation/common/widgets/custom_outlined_button.dart';
import 'package:imdb/presentation/pages/personal/appearance_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

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
              child: Text("USER", style: getLightStyle(fontSize: 13)),
            ),
            Container(
              color: ColorManager.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(onTap: () {}, child: text("Account")),
                  divider(),
                  GestureDetector(
                      onTap: () {}, child: text("Watch preferences")),
                  divider(),
                  GestureDetector(onTap: () {}, child: text("Notifications")),
                  divider(),
                ],
              ),
            ),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text("GENERAL", style: getLightStyle(fontSize: 13)),
            ),
            Container(
              color: ColorManager.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () {
                        Go(context).to(const AppearancePage());
                      },
                      child: text("Display")),
                  divider(),
                  GestureDetector(onTap: () {}, child: text("Storage")),
                  divider(),
                  GestureDetector(onTap: () {}, child: text("About")),
                  divider(),
                ],
              ),
            ),
            const RSizedBox(height: 30),
            Center(
              child: SizedBox(
                width: 110,
                height: 45,
                child: CustomOutlinedButton(
                    child: Text(
                      "SIGN OUT",
                      style: getNormalStyle(color: ColorManager.darkBlue),
                    ),
                    onPressed: () {}),
              ),
            )
          ],
        ),
      ),
    );
  }

  Divider divider() => const Divider(color: ColorManager.grey, height: 1);

  Padding text(String text) {
    return Padding(
      padding: REdgeInsets.all(horizontalPadding),
      child: Text(text, style: getNormalStyle(fontSize: 16)),
    );
  }
}
