import 'package:flutter/material.dart';
import 'package:flutter_todo_application/domain/types/notification_minutes.dart';
import 'package:flutter_todo_application/domain/types/reminder_type.dart';
import 'package:flutter_todo_application/presentation/theme/icons.dart';
import 'package:flutter_todo_application/presentation/theme/radius_styles.dart';
import 'package:flutter_todo_application/presentation/theme/sizes.dart';
import 'package:flutter_todo_application/presentation/theme/text_styles.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile(
    this._type,
    this._reminderMinutes,
    this._onChanged, {
    super.key,
  });

  final ReminderType _type;
  final int? _reminderMinutes;
  final ValueChanged<int?> _onChanged;

  String get _title => switch (_type) {
    ReminderType.start => '開始時通知',
    ReminderType.end => '終了時通知',
  };

  @override
  Widget build(BuildContext context) {
    final notificationMinutes = NotificationMinutes.values;
    return InkWell(
      borderRadius: AppRadius.all,
      onTapDown: (details) {
        final position = details.globalPosition;
        showMenu(
          shape: RoundedRectangleBorder(borderRadius: AppRadius.all),
          position: RelativeRect.fromLTRB(position.dx, position.dy, 0, 0),
          context: context,
          items:
              notificationMinutes
                  .map(
                    (e) => PopupMenuItem(
                      value: e,

                      child:
                          e.minutes != _reminderMinutes
                              //選択してない時用の空アイコン作る
                              ? Row(children: [SizedBox.shrink(), Text(e.text)])
                              : Row(children: [AppIcons.check, Text(e.text)]),
                    ),
                  )
                  .toList(),

          elevation: 8,
        ).then((value) {
          if (value != null) _onChanged(value.minutes);
        });
      },
      child: ListTile(
        tileColor: Theme.of(context).colorScheme.surface,
        shape: RoundedRectangleBorder(borderRadius: AppRadius.top),
        minTileHeight: AppSize.tile2,
        leading: AppIcons.notice,
        title: Text(_title),
        trailing: IntrinsicWidth(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                NotificationMinutes.values
                    .firstWhere((e) => e.minutes == _reminderMinutes)
                    .text,
                style: AppText.trailing,
              ),
              AppIcons.upDown,
            ],
          ),
        ),
      ),
    );
  }
}
