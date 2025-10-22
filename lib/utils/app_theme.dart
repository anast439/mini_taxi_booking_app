import 'package:flutter/material.dart';
import 'package:mini_taxi_booking_app/utils/colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,

    ),
    scaffoldBackgroundColor: AppColors.backGroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
      centerTitle: true,
      elevation: 0,
    ),
    cardTheme: CardThemeData(
      color: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      margin:  EdgeInsets.all(8),
    ),
  );
}
