import 'package:get/get.dart';
import 'package:repo_list/routes/app_pages.dart';

class LoadingController extends GetxController {
  final dummyValue = 0;
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(milliseconds: 1000), () {
      Get.offAllNamed(Routes.HOME_SCREEN);
    });
  }
}
