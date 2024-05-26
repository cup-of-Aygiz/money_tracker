import 'package:flutter/material.dart';
import 'package:money_tracker/app/assets/generated/fonts.gen.dart';
import 'package:money_tracker/uikit/colors/app_colors.dart';

final ThemeData darkThemeData = ThemeData(
  useMaterial3: true,
  fontFamily: FontFamily.gilroy,
  brightness: Brightness.dark,
  expansionTileTheme: const ExpansionTileThemeData(
    childrenPadding: EdgeInsets.zero,
    tilePadding: EdgeInsets.zero,
  ),
  dividerColor: Colors.transparent,
  splashFactory: NoSplash.splashFactory,
  primaryColor: AppColors.white,
  hintColor: AppColors.secondary,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.onyx10,
    selectedItemColor: AppColors.white,
    unselectedItemColor: AppColors.onyx60,
  ),
);
