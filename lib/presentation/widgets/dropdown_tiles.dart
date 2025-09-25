import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_application/presentation/theme/icons.dart';
import 'package:flutter_todo_application/presentation/theme/radius_styles.dart';
import 'package:flutter_todo_application/presentation/theme/text_styles.dart';

class SubTaskDropdown extends HookWidget {
  const SubTaskDropdown(this._onTap, this._isValue, {super.key});

  final VoidCallback _onTap;
  final bool _isValue;

  @override
  Widget build(BuildContext context) {
    final isValue = useState<bool>(_isValue);
    return ListTile(
      minTileHeight: 60,
      tileColor: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: isValue.value ? AppRadius.top : AppRadius.all,
      ),
      onTap: () {
        _onTap();
        isValue.value = !isValue.value;
      },
      title: Text('サブタスク', style: AppText.bodyWM),
      trailing: Icon(
        isValue.value ? IconDatas.dropDown : IconDatas.next,
        size: 28,
      ),
    );
  }
}
