import 'package:flutter/material.dart';
import 'package:flutter_todo_application/domain/types/settings_element.dart';
import 'package:flutter_todo_application/presentation/theme/colors.dart';
import 'package:flutter_todo_application/presentation/theme/text_styles.dart';
import 'package:go_router/go_router.dart';

class SimpleListTile extends StatelessWidget {
  const SimpleListTile(this._settingsElement, {super.key});

  final SettingsItem _settingsElement;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      visualDensity: VisualDensity(vertical: -4),
      onTap: () => context.push(_settingsElement.path),
      title: Text(_settingsElement.title, style: AppText.bodyM),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        size: 16,
        color: BrandColor.darkGray,
      ),
    );
  }
}
