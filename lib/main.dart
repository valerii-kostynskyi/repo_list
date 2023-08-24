import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repo_list/app_binding.dart';
import 'package:repo_list/presentation/home_screen/home_screen.dart';

void main() {
  runApp(GetMaterialApp(
    title: "Application",
    initialBinding: AppBinding(),
    defaultTransition: Transition.fadeIn,
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}
