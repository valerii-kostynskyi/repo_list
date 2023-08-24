import 'package:get/get.dart';
import 'package:repo_list/presentation/favorite_screen/favorite_controller.dart';

class FavoriteBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavoriteController>(() => FavoriteController());
  }
}
