import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repo_list/presentation/favorite_screen/favorite_controller.dart';
import 'package:repo_list/presentation/widget/custom_button_widget.dart';
import 'package:repo_list/presentation/widget/custom_list.dart';
import 'package:repo_list/presentation/widget/empty_screen.dart';
import 'package:repo_list/presentation/widget/item_repository_widget.dart';

class FavoriteScreen extends GetView<FavoriteController> {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text('txt_favorite_screen_app_bar_title'.tr),
      centerTitle: true,
      leadingWidth: 80,
      leading: CustomButtonWidget(
        icon: 'icon_left',
        onTap: () => Get.back(),
      ),
    );
  }

  Widget _body() {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.only(top: 16),
        child: CustomList(
          emptyListMessage: EmptyScreen(text: 'txt_empty_favorite_message'.tr),
          bottomSpace: 0,
          count: controller.repositoryListRx.length,
          onBuildItem: (index) => ItemRepositoryWidget(
            repositoryItem: controller.repositoryListRx[index],
            onTap: () => controller
                .removeFromFavorite(controller.repositoryListRx[index]),
          ),
        ),
      ),
    );
  }
}
