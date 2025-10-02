import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_todo_application/application/state/list_notifier.dart';
import 'package:flutter_todo_application/domain/features/datetime_ext.dart';
import 'package:flutter_todo_application/domain/types/edge.dart';
import 'package:flutter_todo_application/domain/types/importance.dart';
import 'package:flutter_todo_application/domain/types/sub_task.dart';
import 'package:flutter_todo_application/domain/types/tag.dart';
import 'package:flutter_todo_application/domain/types/task.dart';
import 'package:flutter_todo_application/presentation/theme/icons.dart';
import 'package:flutter_todo_application/presentation/theme/radius_styles.dart';
import 'package:flutter_todo_application/presentation/theme/text_styles.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tuple/tuple.dart';

class TaskTile extends ConsumerWidget {
  const TaskTile(this._task, this._tags, this._isEdge, {super.key});

  final Task _task;
  final List<Tag> _tags;

  final Edge _isEdge;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final today = DateTime.now();

    final shape = switch (_isEdge) {
      Edge.middle => null,
      Edge.only => const RoundedRectangleBorder(borderRadius: AppRadius.all),
      Edge.start => const RoundedRectangleBorder(borderRadius: AppRadius.top),
      Edge.end => const RoundedRectangleBorder(borderRadius: AppRadius.bottom),
    };

    final iconColor =
        _task.progress != 0
            ? Theme.of(context).colorScheme.primary
            : Importance.values[_task.importance].color;

    final iconData =
        _task.progress != 0 ? IconDatas.checkCircle : IconDatas.circle;

    return ListTile(
      onTap: () => context.push('/list/edit', extra: Tuple2(_task, _tags)),
      //tileColor: Theme.of(context).colorScheme.surface,
      //shape: shape,
      //dense: true,
      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      visualDensity: VisualDensity(vertical: -4),
      leading: GestureDetector(
        onTap: () {
          final progress = _task.progress != 0 ? 0 : 1;
          ref
              .read(listNotifierProvider.notifier)
              .updateProgress(_task, progress);
        },
        child: Icon(color: iconColor, iconData, size: 36),
      ),
      title: Text(
        _task.title,
        style: AppText.bodyL,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Row(
        children: [
          _task.regularly == 0
              ? SizedBox.shrink()
              : Icon(IconDatas.repeat, size: 18),
          _task.startAt != null
              ? _task.endAt != null
                  ? Text(
                    today.isBefore(_task.startAt!)
                        ? '開始日：${_task.startAt!.format(format: _task.startAt!.year == today.year ? 'M月d日 H:mm' : 'y年M月d日 H:mm')}'
                        : '期限日：${_task.endAt!.format(format: _task.startAt!.year == today.year ? 'M月d日 H:mm' : 'y年M月d日 H:mm')}',
                  )
                  : Text(
                    '開始日：${_task.startAt!.format(format: _task.startAt!.year == today.year ? 'M月d日 H:mm' : 'y年M月d日 H:mm')}',
                  )
              : _task.endAt != null
              ? Text(
                '期限日：${_task.endAt!.format(format: _task.startAt!.year == today.year ? 'M月d日 H:mm' : 'y年M月d日 H:mm')}',
              )
              : SizedBox.shrink(),
          //endも見る
          _task.startReminderMinutes != null
              ? Icon(IconDatas.notice, size: 18)
              : SizedBox.shrink(),
          Spacer(),
          //_task.selectTag != 1 ? Text('# ') : SizedBox.shrink(),
        ],
      ),
      /*trailing:
          _task.selectTag != 1
              ? Text(
                '#${_tags[_task.selectTag - 1].name}',
                style: AppText.bodyM,
              )
              : null,*/
    );
  }
}

/*leading: Transform.scale(
        scale: 1.3,
        child: Checkbox(
          side: BorderSide(width: 2.0, color: BrandColor.darkGray),
          activeColor: Colors.transparent,
          checkColor: MyColors.myBlue,
          shape: CircleBorder(),
          value: selected.value,
          onChanged: (value) => selected.value = value!,
        ),
      ),*/

class ProgressCheckBox extends ConsumerWidget {
  const ProgressCheckBox(
    this._id,
    this._importance,
    this._progress,
    this._onTap, {
    super.key,
  });
  final String _id;
  final int _importance;
  final int _progress;
  final VoidCallback _onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => _onTap(),
      /*final progress = _progress == 0 ? 0 : 1;
        ref.read(listNotifierProvider.notifier).updateProgress(_id, progress);*/
      child: Icon(
        color:
            _progress != 0
                ? Theme.of(context).colorScheme.surface
                : Importance.values[_importance].color,
        _progress != 0 ? IconDatas.checkCircle : IconDatas.circle,

        size: 36,
      ),
    );
  }
}
