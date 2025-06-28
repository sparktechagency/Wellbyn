
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';


ThemeData light({Color color = Appcolors.page}) => ThemeData(
  fontFamily: 'Poppins',
  primaryColor: TextColors.neutral900,
  appBarTheme: AppBarTheme(
      color: Appcolors.page
  ),
  scaffoldBackgroundColor: Appcolors.page,
  secondaryHeaderColor: Color(0xFF1ED7AA),
  disabledColor: Color(0xFFBABFC4),
  brightness: Brightness.light,
  hintColor: Color(0xFF9F9F9F),
  cardColor: Appcolors.page,
  inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Appcolors.primary,
      hintStyle: TextStyle(color: AppColors.hintColor, fontSize: 16.sp),
      isDense: true,
      contentPadding:
      EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      enabledBorder: enableBorder(),
      focusedBorder: focusedBorder(),
      errorBorder: errorBorder()),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    unselectedItemColor: Appcolors.primary,
    selectedLabelStyle: TextStyle(color: AppColors.primaryColor,), // Force color
    // unselectedLabelStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
    elevation: 5,
  ),

  //textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: color)),
  // colorScheme: ColorScheme.light(primary: color, secondary: color).copyWith(background: const Color(0xFFF3F3F3)).copyWith(error: Color(0xFFE84D4F)),
);

OutlineInputBorder enableBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(16.r),
    borderSide: BorderSide(
      color: TextColors.neutral500,
    ),
  );
}

OutlineInputBorder focusedBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(16.r),
    borderSide: BorderSide(
      color: TextColors.neutral500,
    ),
  );
}

OutlineInputBorder errorBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(16.r),
    borderSide: const BorderSide(
      color: Appcolors.error,
    ),
  );
}
