import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repo_list/presentation/home_screen/home_controller.dart';
import 'package:repo_list/presentation/widget/custom_button_widget.dart';
import 'package:repo_list/presentation/widget/custom_list.dart';
import 'package:repo_list/presentation/widget/history_search_list_widget.dart';
import 'package:repo_list/presentation/widget/input_text_field_widget.dart';
import 'package:repo_list/presentation/widget/item_repository_widget.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: [
          _searchBar(),
          _content(),
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text('txt_home_screen_app_bar_title'.tr),
      actions: [
        CustomButtonWidget(
          onTap: () => controller.navigateToFavoriteScreen(),
          icon: 'icon_star',
        ),
      ],
    );
  }

  Widget _searchBar() {
    return Obx(
      () => Container(
        width: Get.width,
        decoration: BoxDecoration(color: Get.theme.scaffoldBackgroundColor),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              InputTextFieldWidget(
                hintText: 'txt_search_hint'.tr,
                isShowSuffixIconAsset: controller.isShowClearIcon.value,
                controller: controller.searchController,
                onChanged: (value) => controller.search(value),
                focused: controller.focused.value,
                onTap: () => controller.changeFocus(),
                onSuffixTap: () => controller.clearSearchController(),
              ),
              if (controller.repositoryListRx.isNotEmpty)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    'txt_what_we_found_title'.tr,
                    style: Get.textTheme.headlineMedium,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _content() {
    return Expanded(
      child: Obx(
        () =>
            controller.repositoryListRx.isNotEmpty || controller.isLoading.value
                ? _repositoryList()
                : _searchHistory(),
      ),
    );
  }

  Widget _repositoryList() {
    return CustomList(
      bottomSpace: 0,
      count: controller.repositoryListRx.length,
      onBuildItem: (index) => ItemRepositoryWidget(
        repositoryItem: controller.repositoryListRx[index],
        onTap: () =>
            controller.toggleFavorite(controller.repositoryListRx[index]),
      ),
      onPullToRefresh: () => controller.getRepositoryList(
        searchText: controller.searchController.text,
        reset: true,
      ),
      onEndOfPage: () => controller.getRepositoryList(
          searchText: controller.searchController.text),
      isLoading: controller.isLoading.value,
      firstLoadingScreen: controller.isFirstLoadingScreen.value,
    );
  }

  Widget _searchHistory() {
    return HistorySearchListWidget(
      list: controller.listSearch,
      onTap: (value) => controller.addValueToSearchBar(value),
      onClearButtonTap: () => controller.clearHistory(),
    );
  }
}
