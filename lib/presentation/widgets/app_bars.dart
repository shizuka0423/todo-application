import 'package:flutter/material.dart';
import 'package:flutter_todo_application/presentation/widgets/buttons.dart';

AppBar listAppBar() {
  return AppBar(
    leading: TagListButton(),
    //centerTitle: true,
    //title: Text(item.title, style: AppText.appBarStyle),
    actions: [SearchButton(), SortButton()],
    toolbarHeight: 45,
  );
}
