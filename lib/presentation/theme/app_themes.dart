import 'package:flutter/material.dart';
import 'package:flutter_todo_application/presentation/theme/colors.dart';

ThemeData appLightTheme(int colorCode) {
  final colors = MyThemeColors.values;
  final color =
      colors
          .firstWhere((e) => e.light == colorCode, orElse: () => colors[0])
          .light;

  return ThemeData.light().copyWith(
    /*appBarTheme: AppBarTheme(color: Color(color)),
    buttonTheme: ButtonThemeData(buttonColor: Color(color)),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Color(color),
    ),
    scaffoldBackgroundColor: BrandColor.lightGray,
    listTileTheme: ListTileThemeData(tileColor: BrandColor.white),*/
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Color(color),
      onPrimary: Color(color),
      secondary: BrandColor.lightGray,
      onSecondary: BrandColor.lightGray,
      error: Colors.red,
      onError: BrandColor.white,
      surface: BrandColor.white,
      onSurface: BrandColor.black,
    ),
    scaffoldBackgroundColor: BrandColor.lightGray,
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: BrandColor.lightGray,
    ),
  );
}

ThemeData appDarkTheme(int colorCode) {
  final colors = MyThemeColors.values;
  final color =
      colors
          .firstWhere((e) => e.dark == colorCode, orElse: () => colors[0])
          .dark;
  return ThemeData.dark().copyWith(
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: Color(color),
      onPrimary: Color(color),
      secondary: Color(color),
      onSecondary: BrandColor.gray,
      error: Colors.red,
      onError: BrandColor.white,
      surface: BrandColor.darkGray,
      onSurface: BrandColor.white,
    ),

    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: BrandColor.paleBlack,
    ),
  );
}
