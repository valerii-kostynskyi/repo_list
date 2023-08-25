import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repo_list/presentation/home_screen/home_controller.dart';
import 'package:repo_list/presentation/widget/custom_button_widget.dart';
import 'package:repo_list/presentation/widget/custom_list.dart';
import 'package:repo_list/presentation/widget/input_text_field_widget.dart';
import 'package:repo_list/presentation/widget/item_repository_widget.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Github repos list'),
        actions: [
          CustomButtonWidget(
            onTap: () => controller.openFavoritePage(),
            icon: 'icon_star',
          ),
        ],
      ),
      body: Column(
        children: [
          Obx(
            () => Padding(
              padding: const EdgeInsets.all(16),
              child: InputTextFieldWidget(
                hintText: 'Search',
                isShowSuffixIconAsset: controller.isShowClearIcon.value,
                controller: controller.searchController,
                onChanged: (value) => controller.search(value),
                focused: controller.focused.value,
                onTap: () => controller.changeFocus(),
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => CustomList(
                bottomSpace: 0,
                count: controller.repositoryListRx.length,
                onBuildItem: (index) => ItemRepositoryWidget(
                  repositoryItem: controller.repositoryListRx[index],
                  onTap: () => controller
                      .toggleFavorite(controller.repositoryListRx[index]),
                ),
                onPullToRefresh: () => controller.getRepositoryList(
                  searchText: controller.searchController.text,
                  reset: true,
                ),
                onEndOfPage: () => controller.getRepositoryList(
                  searchText: controller.searchController.text,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
