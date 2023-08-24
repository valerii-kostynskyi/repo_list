import 'package:get/get.dart';
import 'package:repo_list/presentation/home_screen/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
