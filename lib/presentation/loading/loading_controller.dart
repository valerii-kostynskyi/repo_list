import 'package:get/get.dart';
import 'package:repo_list/routes/app_pages.dart';

class LoadingController extends GetxController {
  final controllerInitializer = 0;
  @override
  void onInit() {
    super.onInit();
    _redirectToHomeAfterDelay();
  }

  void _redirectToHomeAfterDelay() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      Get.offAllNamed(Routes.HOME_SCREEN);
    });
  }
}
