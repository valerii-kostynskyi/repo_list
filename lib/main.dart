import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repo_list/app_binding.dart';
import 'package:repo_list/routes/app_pages.dart';
import 'package:repo_list/style/theme.dart';

import 'util/translation/translations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      initialBinding: AppBinding(),
      defaultTransition: Transition.fadeIn,
      debugShowCheckedModeBanner: false,
      translations: Translation(),
      locale: const Locale('en'),
      getPages: AppPages.routes,
      theme: lightTheme,
    ),
  );
}
