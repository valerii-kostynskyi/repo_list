import 'package:get/get.dart';
import 'package:repo_list/presentation/loading/loading_controller.dart';

class LoadingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoadingController>(() => LoadingController());
  }
}
