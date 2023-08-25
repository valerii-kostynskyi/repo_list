import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repo_list/presentation/loading/loading_controller.dart';

class LoadingScreen extends GetView<LoadingController> {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dummyValue = controller.dummyValue;
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Search App', style: Get.textTheme.bodySmall),
            const SizedBox(height: 16),
            CupertinoActivityIndicator(
              color: Get.theme.scaffoldBackgroundColor,
            ),
          ],
        ),
      ),
    );
  }
}
