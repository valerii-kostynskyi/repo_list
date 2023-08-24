import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repo_list/presentation/favorite_screen/favorite_controller.dart';
import 'package:repo_list/presentation/widget/custom_button_widget.dart';

class FavoriteScreen extends GetView<FavoriteController> {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Github repos list'),
        actions: [
          CustomButtonWidget(onTap: () {}, icon: 'icon_star'),
        ],
      ),
      body: Column(),
    );
  }
}
