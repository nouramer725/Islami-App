import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_colors.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.transparentColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.whiteColor,
      unselectedItemColor: AppColors.blackColor,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: false,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.appColor,
      iconTheme: IconThemeData(
        color: AppColors.goldColor
      )
    )
  );
}
