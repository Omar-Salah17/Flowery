import 'package:flowery/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApplicationTheme {
  static ThemeData themeData = ThemeData(
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        fontFamily: "Inter",
        fontWeight: FontWeight.w500,
        fontSize: 20.sp,
        color: PalletsColors.blackBase,
      ),
      centerTitle: false,
    ),
    textTheme: TextTheme(
      bodySmall: TextStyle(
        fontFamily: "Inter",
        fontSize: 12.sp,
        color: PalletsColors.gray,
      ),
      titleMedium: TextStyle(fontSize: 20.sp, color: PalletsColors.blackBase),
      labelMedium: TextStyle(
        fontFamily: "Inter",
        fontSize: 16.sp,
        color: PalletsColors.whiteBase,
      ),
      displayMedium: TextStyle(
        fontFamily: "Roboto",
        fontSize: 20.sp,
        color: PalletsColors.blackBase,
      ),
      labelSmall: TextStyle(
        fontFamily: "Inter",
        fontSize: 13.sp,
        color: PalletsColors.whiteBase,
      ),
      bodyMedium: TextStyle(fontSize: 14.sp, color: PalletsColors.blackBase),
      headlineMedium: TextStyle(
        fontFamily: "Inter",
        fontSize: 16.sp,
        color: PalletsColors.blackBase,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 15.h),
        backgroundColor: PalletsColors.mainColorBase,
        foregroundColor: PalletsColors.whiteBase,
        disabledBackgroundColor: PalletsColors.gray,
        disabledForegroundColor: PalletsColors.whiteBase,
        textStyle: TextStyle(
          fontFamily: "Inter",
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        minimumSize: Size(double.infinity, 48.h),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(foregroundColor: PalletsColors.gray),
    ),
  );
}
