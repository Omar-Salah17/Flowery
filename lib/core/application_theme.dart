import 'package:flowery/core/colors.dart';
import 'package:flutter/material.dart';

class ApplicationTheme {
  static ThemeData themeData = ThemeData(
    // appBarTheme: AppBarTheme(
    //   backgroundColor: PalletsColors.green,
    //   toolbarHeight: 93,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.only(
    //         bottomRight: Radius.circular(50),
    //         bottomLeft: Radius.circular(50)),
    //   ),
    // ),
    textTheme: TextTheme(
      bodySmall: TextStyle(
        fontSize: 12,
        color: PalletsColors.gray,
      ),
      titleMedium: TextStyle(fontSize: 20, color: PalletsColors.blackBase),
      bodyMedium: TextStyle(fontSize: 14, color: PalletsColors.blackBase),
    ),

  //   filledButtonTheme: FilledButtonThemeData(style: ButtonStyle)
  // )
  
  );
}
