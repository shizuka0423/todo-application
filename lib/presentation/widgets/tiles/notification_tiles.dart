import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_todo_application/presentation/theme/icons.dart';
import 'package:flutter_todo_application/presentation/theme/radius_styles.dart';
import 'package:flutter_todo_application/presentation/theme/sizes.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile(this._checked, this._onChanged, {super.key});

  final bool _checked;
  final ValueChanged<bool> _onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: AppRadius.top),
      minTileHeight: AppSize.tile2,
      leading: AppIcons.notice,
      title: Text('通知'),
      trailing: CupertinoSwitch(
        value: _checked,
        onChanged: (value) => _onChanged(value),
      ),
    );
  }
}
