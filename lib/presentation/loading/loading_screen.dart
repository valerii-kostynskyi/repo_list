// ignore_for_file: unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repo_list/const.dart';
import 'package:repo_list/presentation/loading/loading_controller.dart';

class LoadingScreen extends GetView<LoadingController> {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// A placeholder value to ensure the controller is initialized by GetX.
    /// In GetX, the controller starts its lifecycle only when a value from it is accessed from the UI.
    final controllerInitializer = controller.controllerInitializer;
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.primary,
      body: _body(),
    );
  }

  Widget _body() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            appTitle,
            style: Get.textTheme.bodySmall!
                .copyWith(color: Get.theme.scaffoldBackgroundColor),
          ),
          const SizedBox(height: 16),
          CupertinoActivityIndicator(
            color: Get.theme.scaffoldBackgroundColor,
          ),
        ],
      ),
    );
  }
}
