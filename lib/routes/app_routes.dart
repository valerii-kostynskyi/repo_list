// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const LOADING_SCREEN = _Paths.LOADING_SCREEN;
  static const HOME_SCREEN = _Paths.HOME_SCREEN;
  static const FAVORITE_PAGE = _Paths.FAVORITE_SCREEN;
}

abstract class _Paths {
  static const LOADING_SCREEN = '/loading-screen';
  static const HOME_SCREEN = '/home-screen';
  static const FAVORITE_SCREEN = '/favorite_page';
}
