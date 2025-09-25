import 'package:flutter/material.dart';
import 'package:flutter_todo_application/presentation/theme/sizes.dart';

class AppRadius {
  static const all = BorderRadius.all(Radius.circular(RawSize.p8));

  static const top = BorderRadius.vertical(top: Radius.circular(RawSize.p8));

  static const bottom = BorderRadius.vertical(
    bottom: Radius.circular(RawSize.p8),
  );

  static const appBar = BorderRadius.vertical(top: Radius.circular(RawSize.p8));
}

class AppShapes {
  static const top = RoundedRectangleBorder(borderRadius: AppRadius.top);

  static const bottom = RoundedRectangleBorder(borderRadius: AppRadius.bottom);
}
