import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repo_list/presentation/home_screen/home_controller.dart';
import 'package:repo_list/presentation/widget/custom_button_widget.dart';
import 'package:repo_list/presentation/widget/input_text_field_widget.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Github repos list'),
        actions: [
          CustomButtonWidget(onTap: () {}, icon: 'icon_star'),
        ],
      ),
      body: Column(
        children: [
          Obx(
            () => Padding(
              padding: const EdgeInsets.all(16),
              child: InputTextFieldWidget(
                controller: controller.searchController,
                hintText: 'Search',
                onChanged: (value) {
                  controller.search(value);
                },
                onTapSuffix: () => controller.clearSearchController(),
              ),
            ),
          ),
          Center(
            child: Text("Welcome to the Home Screen!"),
          ),
        ],
      ),
    );
  }
}
