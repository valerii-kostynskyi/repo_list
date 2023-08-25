import 'package:get/get.dart';
import 'package:repo_list/presentation/favorite_screen/favorite_binding.dart';
import 'package:repo_list/presentation/favorite_screen/favorite_screen.dart';
import 'package:repo_list/presentation/home_screen/home_binding.dart';
import 'package:repo_list/presentation/home_screen/home_screen.dart';
import 'package:repo_list/presentation/loading/loading_binding.dart';
import 'package:repo_list/presentation/loading/loading_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.LOADING_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.LOADING_SCREEN,
      page: () => const LoadingScreen(),
      binding: LoadingBinding(),
    ),
    GetPage(
      name: _Paths.HOME_SCREEN,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.FAVORITE_SCREEN,
      page: () => const FavoriteScreen(),
      binding: FavoriteBinding(),
    ),
  ];
}
