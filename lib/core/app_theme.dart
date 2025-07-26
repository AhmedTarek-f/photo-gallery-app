import 'package:flutter/material.dart';
import 'package:photo_gallery_app/core/constants/app_colors.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: ColorScheme.fromSeed(
      primary: AppColors.white,
      secondary: AppColors.black,
      onPrimary: AppColors.blue,
      seedColor: Colors.white,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.black,
    colorScheme: ColorScheme.fromSeed(
      primary: AppColors.black,
      secondary: AppColors.white,
      onPrimary: AppColors.white,
      seedColor: Colors.black,
    ),
  );
}
