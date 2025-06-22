
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';


ThemeData light({Color color = const Color(0xFFFFD400)}) => ThemeData(
  fontFamily: 'Poppins',
  primaryColor: AppColors.textColor,
  appBarTheme: AppBarTheme(
      color: Colors.white
  ),
  scaffoldBackgroundColor: Colors.white,
  secondaryHeaderColor: Color(0xFF1ED7AA),
  disabledColor: Color(0xFFBABFC4),
  brightness: Brightness.light,
  hintColor: Color(0xFF9F9F9F),
  cardColor: Colors.white,
  inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.fillColor,
      hintStyle: TextStyle(color: AppColors.hintColor, fontSize: 16.sp),
      isDense: true,
      contentPadding:
      EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      enabledBorder: enableBorder(),
      focusedBorder: focusedBorder(),
      errorBorder: errorBorder()),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    unselectedItemColor: AppColors.primaryColor,
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
      color: AppColors.borderColor,
    ),
  );
}

OutlineInputBorder focusedBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(16.r),
    borderSide: BorderSide(
      color: AppColors.borderColor,
    ),
  );
}

OutlineInputBorder errorBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(16.r),
    borderSide: const BorderSide(
      color: Colors.red,
    ),
  );
}
