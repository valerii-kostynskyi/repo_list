import 'package:get/get.dart';
import 'package:repo_list/presentation/favorite_screen/favorite_binding.dart';
import 'package:repo_list/presentation/favorite_screen/favorite_screen.dart';
import 'package:repo_list/presentation/home_screen/home_binding.dart';
import 'package:repo_list/presentation/home_screen/home_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.HOME_SCREEN;

  static final routes = [
    //----------------------
    GetPage(
      name: _Paths.HOME_SCREEN,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    //-----------------AUTH  ----------------------

    GetPage(
      name: _Paths.FAVORITE_SCREEN,
      page: () => const FavoriteScreen(),
      binding: FavoriteBinding(),
    ),
  ];
}
