import 'package:flutter/material.dart';

class BrandColor {
  static const gray = Color(0xFFAAAAAA);
  static const lightGray = Color(0xFFF0F0F6);
  static const darkGray = Color(0xFF333333);
  static const paleBlack = Color(0xFF191919);

  static const white = Colors.white;
  static const black = Colors.black;
}

enum MyThemeColors {
  myBlue(0xFF93C9FF, 0xFF7FBFFF),
  myPurple(0xFFC993FF, 0xFFBF7FFF),
  myPink(0xFFFF93C9, 0xFFFF7FBF),
  myOrange(0xFFFFC993, 0xFFFFBF7F),
  myYellow(0xFFFFFF93, 0xFFFFFF7F),
  myGreen(0xFF93FFC9, 0xFF7FFFBF),
  monotone(0xFFFFFFFF, 0xFF000000);

  final int dark;
  final int light;
  const MyThemeColors(this.dark, this.light);
}

enum TagColors {
  tagBlue(0xFF93C9FF, 'ブルー'),
  tagPurple(0xFFC993FF, 'パープル'),
  tagPink(0xFFFF93C9, 'ピンク'),
  tagOrange(0xFFFFC993, 'オレンジ'),
  tagYellow(0xFFFFFF93, 'イエロー'),
  tagGreen(0xFF93FFC9, 'グリーン');

  final int color;
  final String name;
  const TagColors(this.color, this.name);
}
