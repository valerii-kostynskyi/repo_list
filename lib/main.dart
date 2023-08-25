import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repo_list/app_binding.dart';
import 'package:repo_list/routes/app_pages.dart';
import 'package:repo_list/style/theme.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      initialBinding: AppBinding(),
      defaultTransition: Transition.fadeIn,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      theme: lightTheme,
    ),
  );
}
