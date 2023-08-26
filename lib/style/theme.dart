import 'package:flutter/material.dart';
import 'package:repo_list/style/app_colors.dart';

final lightTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.main,
  fontFamily: 'Raleway',
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.main,
    elevation: 1,
    titleTextStyle: TextStyle(
      color: AppColors.primaryText,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
  ),
  textTheme: const TextTheme(
    headlineMedium: TextStyle(
      fontFamily: 'Raleway',
      fontSize: 16,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      color: AppColors.primary,
    ),
    headlineLarge: TextStyle(
      fontFamily: 'Raleway',
      fontSize: 16,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      color: AppColors.primaryText,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Raleway',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      color: AppColors.primaryText,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Raleway',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      color: AppColors.placeholder,
    ),
  ),
  brightness: Brightness.light,
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: AppColors.main,
    secondary: AppColors.secondary,
    onSecondary: AppColors.placeholder,
    background: AppColors.main,
    onBackground: AppColors.divider,
    error: Colors.red,
    onError: Colors.red,
    surface: AppColors.main,
    onSurface: AppColors.main,
  ),
  listTileTheme: ListTileThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    tileColor: AppColors.divider,
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: const TextStyle(
      fontSize: 14,
      color: AppColors.placeholder,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(
        width: 0,
        style: BorderStyle.none,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(
        width: 1,
        style: BorderStyle.solid,
        color: AppColors.primary,
      ),
    ),
    filled: true,
  ),
);
