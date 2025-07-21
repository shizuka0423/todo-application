import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_application/presentation/router/routes.dart';
import 'package:go_router/go_router.dart';

class LayoutScaffold extends HookWidget {
  const LayoutScaffold({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final barItems = BottomNavigationBarItems.values;

    return Scaffold(
      //appBar: selectedItem.value == barItems[1] ? listAppBar() : null,
      body: navigationShell,
      drawer: Drawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex, // 選択中のindex
        onTap: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
        items:
            barItems
                .map(
                  (e) => BottomNavigationBarItem(
                    icon: e.selectedIcon,
                    activeIcon: e.unSelectedIcon,
                    label: e.title,
                  ),
                )
                .toList(),
      ),
    );
  }
}
