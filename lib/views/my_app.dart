import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imdb/helper/resources/color_manager.dart';
import 'package:imdb/helper/themes/app_theme.dart';
import 'package:imdb/helper/themes/theme_service.dart';
import 'package:imdb/helper/translations/app_lang.dart';
import 'package:imdb/helper/translations/translations.dart';
import 'package:imdb/views/base_layouts/base_layout.dart';
import 'package:imdb/views/multi_bloc_provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocs(materialApp());
  }

  ScreenUtilInit materialApp() {
    return ScreenUtilInit(
      designSize: const Size(392, 781),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetBuilder<AppLanguage>(
          init: AppLanguage(),
          builder: (controller) {
            return AnnotatedRegion<SystemUiOverlayStyle>(
              value: const SystemUiOverlayStyle(
                  statusBarColor: ColorManager.black87,
                  statusBarIconBrightness: Brightness.light),
              child: GetMaterialApp(
                title: 'imdb',
                theme: AppTheme.light,
                translations: Translation(),
                locale: Locale(controller.appLang),
                fallbackLocale: const Locale('en'),
                darkTheme: AppTheme.dark,
                themeMode: ThemeOfApp().theme,
                debugShowCheckedModeBanner: false,
                home: const BaseLayout(),
              ),
            );
          },
        );
      },
    );
  }
}
