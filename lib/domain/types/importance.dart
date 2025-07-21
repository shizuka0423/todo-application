import 'package:flutter/material.dart';

enum Importance {
  none("設定なし", Colors.grey),
  high("優先", Colors.lightGreen),
  critical("最優先", Colors.red);

  const Importance(this.name, this.color);
  final String name;
  final Color color;
}
