import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb/core/resources/color_manager.dart';
import 'package:imdb/presentation/pages/home/home_page.dart';
// import 'package:imdb/data/models/personal_info.dart';
// import 'package:imdb/presentation/pages/account/account_page.dart';
// import 'package:imdb/presentation/pages/activity/activity_page.dart';
// import 'package:imdb/presentation/pages/home/home_page.dart';

class BaseLayout extends StatefulWidget {
  const BaseLayout({Key? key}) : super(key: key);

  @override
  State<BaseLayout> createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> {
  CupertinoTabController controller = CupertinoTabController();

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      resizeToAvoidBottomInset: false,
      tabBar: CupertinoTabBar(
        backgroundColor: Theme.of(context).primaryColor,
        height: 55.h,
        border: Border(
            top: BorderSide(color: ColorManager.lowOpacityGrey, width: .5.w)),
        inactiveColor: ColorManager.lightGrey,
        activeColor: ColorManager.black,
        items: [
          navigationBarItem(Icons.home_rounded, "Home"),
          navigationBarItem(Icons.search_rounded, "Search"),
          navigationBarItem(Icons.slow_motion_video_sharp, "Video"),
          navigationBarItem(Icons.person_pin, "You"),
        ],
      ),
      controller: controller,
      tabBuilder: (context, index) {
        // switch (index) {
        // case 0:
        return homePage();
        // case 1:
        //   return activityPage();
        // default:
        //   return accountPage();
        // }
      },
    );
  }

  Widget homePage() => CupertinoTabView(
        builder: (context) => CupertinoApp(
          builder: (context, child) => const CupertinoPageScaffold(
              resizeToAvoidBottomInset: false, child: HomePage()),
        ),
      );

  // Widget activityPage() => CupertinoTabView(
  //       builder: (context) =>
  //           const CupertinoPageScaffold(
             // resizeToAvoidBottomInset: false,child: ActivityPage()),
  //     );

  // Widget accountPage() => CupertinoTabView(
  //       builder: (context) => const CupertinoPageScaffold(
            //  resizeToAvoidBottomInset: false,child: AccountPage()),
  //     );

  BottomNavigationBarItem navigationBarItem(IconData icon, String label) {
    return BottomNavigationBarItem(icon: Icon(icon, size: 25.r), label: label);
  }
}
