import 'package:flutter/material.dart';
import 'package:iac_task/core/utils/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData.light(useMaterial3: true).copyWith(
      scaffoldBackgroundColor: AppColors.scaffoldWhiteColor,
      primaryColor: AppColors.primaryColor,

      //can customize the button to be the default button in the app
      // instead of custom button widget

      // elevatedButtonTheme: ElevatedButtonThemeData(
      //   style: ElevatedButton.styleFrom(
      //     backgroundColor: AppColors.primaryColor,
      //   ),
      // ),
    );
  }
  static ThemeData darkTheme() {
    return ThemeData.dark(useMaterial3: true);
  }
}