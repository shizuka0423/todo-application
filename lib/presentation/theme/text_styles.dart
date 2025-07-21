import 'package:flutter/material.dart';
import 'package:flutter_todo_application/presentation/theme/sizes.dart';

class AppFont {
  static const general = 'Inter';
}

class AppText {
  static const appBarStyle = TextStyle(
    fontSize: RawSize.p28,
    fontFamily: AppFont.general,
    fontWeight: FontWeight.bold,
  );
  static const appBarM = TextStyle(
    fontSize: RawSize.p18,
    fontFamily: AppFont.general,
    //fontWeight: FontWeight.bold,
  );

  static const h1 = TextStyle(
    fontSize: RawSize.p28,
    fontFamily: AppFont.general,
    fontWeight: FontWeight.bold,
  );

  static const bodyL = TextStyle(
    fontSize: RawSize.p20,
    fontFamily: AppFont.general,
  );

  static const bodyM = TextStyle(
    fontSize: RawSize.p16,
    fontFamily: AppFont.general,
  );

  static const bodyS = TextStyle(
    fontSize: RawSize.p12,
    fontFamily: AppFont.general,
  );

  static const bodyWM = TextStyle(
    fontSize: RawSize.p16,
    fontFamily: AppFont.general,
    fontWeight: FontWeight.bold,
  );

  static const bodyWS = TextStyle(
    fontSize: RawSize.p12,
    fontFamily: AppFont.general,
    fontWeight: FontWeight.bold,
  );

  static const trailing = TextStyle(
    fontSize: RawSize.p14,
    fontFamily: AppFont.general,
  );

  static const widgetM = TextStyle(
    fontSize: RawSize.p24,
    fontFamily: AppFont.general,
  );
}
