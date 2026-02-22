import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.blackColor,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.blackColor,
        centerTitle: true,
      ),
      inputDecorationTheme: InputDecorationTheme(
        prefixIconColor: AppColors.whiteColor,
      )

  );
}
