import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repo_list/presentation/home_screen/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen")),
      body: Center(child: Text("Welcome to the Home Screen!")),
    );
  }
}
