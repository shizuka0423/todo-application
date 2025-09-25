import 'package:flutter/material.dart';

class RouterPath {
  static const String home = '/home';
  static const String list = '/list';
  static const String settings = '/settings';

  static const String edit = 'edit';
  static const String registration = 'registration';
  static const String tagSelect = 'tagSelect';

  static const String delete = 'delete';
  static const String dateOrder = 'dateOrder';
  static const String theme = 'theme';
  static const String subTaskRegistration = 'subTaskRegistration';
  static const String subTaskEdit = 'subTaskEdit';

  static const String tagList = 'tagList';
  static const String tagRegistration = 'tagRegistration';
  static const String tagEdit = 'tagEdit';
  static const String tagDelete = 'tagDelete';

  static const String confirmBack = 'confirmBack';
}

enum BottomNavigationBarItems {
  home(Icon(Icons.home_outlined), Icon(Icons.home), 'ホーム'),
  list(Icon(Icons.view_list_outlined), Icon(Icons.view_list), '一覧'),
  settings(Icon(Icons.settings_outlined), Icon(Icons.settings), '設定');

  final Icon selectedIcon;
  final Icon unSelectedIcon;
  final String title;
  const BottomNavigationBarItems(
    this.selectedIcon,
    this.unSelectedIcon,
    this.title,
  );
}
