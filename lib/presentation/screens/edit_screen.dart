import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_application/application/state/edit_notifier.dart';
import 'package:flutter_todo_application/application/state/sub_task_notifier.dart';
import 'package:flutter_todo_application/domain/types/edge.dart';
import 'package:flutter_todo_application/domain/types/importance.dart';
import 'package:flutter_todo_application/domain/types/sub_task.dart';
import 'package:flutter_todo_application/domain/types/tag.dart';
import 'package:flutter_todo_application/domain/types/task.dart';
import 'package:flutter_todo_application/domain/features/datetime_ext.dart';
import 'package:flutter_todo_application/presentation/theme/icons.dart';
import 'package:flutter_todo_application/presentation/theme/radius_styles.dart';
import 'package:flutter_todo_application/presentation/theme/sizes.dart';
import 'package:flutter_todo_application/presentation/theme/text_styles.dart';
import 'package:flutter_todo_application/presentation/widgets/buttons.dart';
import 'package:flutter_todo_application/presentation/widgets/custom_divider.dart';
import 'package:flutter_todo_application/presentation/widgets/dropdown_tiles.dart';
import 'package:flutter_todo_application/presentation/widgets/list_tiles.dart';
import 'package:flutter_todo_application/presentation/widgets/table_calendar_screen.dart';
import 'package:flutter_todo_application/presentation/widgets/text_fields.dart';
import 'package:flutter_todo_application/presentation/widgets/tiles/date_pick_tiles.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EditScreen extends HookConsumerWidget {
  const EditScreen(this._task, this._tags, {super.key});

  final Task _task;
  final List<Tag> _tags;

  // static MaterialPageRoute route(Task task, List<Tag> tags) {
  //   return MaterialPageRoute(builder: (_) => EditScreen(task, tags));
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useTextEditingController(text: _task.title);
    final descController = useTextEditingController(text: _task.description);
    final isTagId = useState<String?>(_task.tagId);
    final isImportance = useState<int>(_task.importance);
    final isProgress = useState<int>(_task.progress);
    final isRegularly = useState<int>(_task.regularly);
    //final isRepeatCount = useState<int>(0);
    final startAt = useState<DateTime?>(_task.startAt);
    final endAt = useState<DateTime?>(_task.endAt);
    final remindMinute = useState<bool>(_task.remindMinute == 1);

    final isLoading = useState<bool>(true);
    final isValid = useState<bool>(true);

    final isDateListIndex = useState<int>(0);

    final subTasks = ref.watch(subTaskNotifierProvider);
    final showSubTask = useState<bool>(false);

    final blank = const SizedBox(height: 12);

    useEffect(() {
      final notifier = ref.read(subTaskNotifierProvider.notifier);
      notifier.loadSubTask(_task.id).then((_) => isLoading.value = false);
      titleController.addListener(() {
        //何も変えてないときはどうするか
        isValid.value = titleController.text.isNotEmpty;
      });
      return null;
    }, const []);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('予定を編集'),
        actions: [
          TextButton(
            onPressed:
                isValid.value
                    ? () async {
                      isLoading.value = true;
                      final notifier = ref.read(editNotifierProvider.notifier);
                      final updated = _task.copyWith(
                        title: titleController.text,
                        description: descController.text,
                        tagId: isTagId.value,
                        importance: isImportance.value,
                        progress: isProgress.value,
                        regularly: isRegularly.value,
                        repeatCount: 0,
                        startAt: startAt.value,
                        endAt: endAt.value,
                        updatedAt: DateTime.now(),
                        remindMinute: remindMinute.value ? 1 : 0,
                      );
                      await notifier.updateTask(updated);
                      isLoading.value = false;
                      if (context.mounted) {
                        context.pop();
                      }
                    }
                    : null,
            child: const Text('保存'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 12, 18, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              blank,
              TitleTextField(titleController),
              blank,
              DescriptionTextField(descController),
              blank,
              ImportanceTile(
                isImportance.value,
                (selected) => isImportance.value = selected,
              ),
              blank,
              TagTile(_tags, isTagId.value, (value) => isTagId.value = value),
              blank,

              Column(
                children: [
                  StartAtTile(
                    startAt.value,
                    (index) =>
                        isDateListIndex.value =
                            index == isDateListIndex.value ? 0 : index,
                  ),
                  CustomDivider(),
                  isDateListIndex.value == 1
                      ? RegistrationTableCalendar(
                        (date) => startAt.value = date,
                        false,
                        startAt.value,
                      )
                      : isDateListIndex.value == 3
                      ? TimePicker(
                        startAt.value,
                        false,
                        (date) => startAt.value = date,
                      )
                      : SizedBox.shrink(),
                  CustomDivider(),
                  EndAtTile(
                    isDateListIndex.value,
                    endAt.value,
                    (index) =>
                        isDateListIndex.value =
                            index == isDateListIndex.value ? 0 : index,
                  ),
                  isDateListIndex.value == 2
                      ? RegistrationTableCalendar(
                        (date) => endAt.value = date,
                        true,
                        endAt.value,
                      )
                      : isDateListIndex.value == 4
                      ? TimePicker(
                        endAt.value,
                        true,
                        (date) => endAt.value = date,
                      )
                      : SizedBox.shrink(),
                ],
              ),

              startAt.value != null || endAt.value != null
                  ? Column(
                    children: [
                      blank,
                      NotificationTile(
                        remindMinute.value,
                        (value) => remindMinute.value = value,
                      ),
                      CustomDivider(),
                      RegularlyTile(
                        isRegularly.value,
                        (index) => isRegularly.value = index,
                      ),
                    ],
                  )
                  : SizedBox.shrink(),
              blank,

              Column(
                children: [
                  SubTaskDropdown(
                    () => showSubTask.value = !showSubTask.value,
                    showSubTask.value,
                  ),
                  if (showSubTask.value) Divider(height: 0, thickness: 0),
                  if (showSubTask.value)
                    ...List.generate(subTasks.length, (index) {
                      final subTask = subTasks[index];
                      return Column(
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.only(left: 16),
                            onTap:
                                () => context.push(
                                  '/list/edit/subTaskEdit',
                                  extra: subTask,
                                ),
                            minTileHeight: AppSize.tile2,
                            tileColor: Theme.of(context).colorScheme.surface,
                            leading: GestureDetector(
                              onTap: () {},
                              //final progress = subTask.progress != 0 ? 0 : 1;
                              /*ref
                            .read(listNotifierProvider.notifier)
                            .updateProgress(_task.id, progress);
                      */
                              child: Icon(
                                color:
                                    subTask.progress != 0
                                        ? Theme.of(context).colorScheme.primary
                                        : null,
                                subTask.progress != 0
                                    ? IconDatas.checkCircle
                                    : IconDatas.circle,

                                size: 28,
                              ),
                            ),
                            title: Text(subTask.title),

                            trailing:
                                subTask.progress == 0
                                    ? IconButton(
                                      /*style: IconButton.styleFrom(
                                        backgroundColor: Colors.red,
                                        shape: RoundedRectangleBorder(),
                                        minimumSize: Size(10, double.infinity),
                                      ),*/
                                      onPressed: () {},
                                      icon: const Icon(
                                        IconDatas.delete,
                                        size: 28,
                                      ),
                                    )
                                    : null,
                          ),
                          const CustomDivider(),
                        ],
                      );
                    }),
                  if (showSubTask.value)
                    ListTile(
                      minTileHeight: AppSize.tile2,
                      tileColor: Theme.of(context).colorScheme.surface,
                      shape: const RoundedRectangleBorder(
                        borderRadius: AppRadius.bottom,
                      ),
                      onTap:
                          subTasks.length <= 10
                              ? () => context.push(
                                '/list/edit/subTaskRegistration',
                                extra: _task.id,
                              )
                              : null,

                      leading: const Icon(IconDatas.add, size: 28),
                      title: const Text('サブタスクを追加'),
                    ),
                ],
              ),

              /*Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'created_at : ${_task.createdAt.format()}',
                  style: const TextStyle(fontSize: 12),
                ),
              ),
              sizedBox,
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'updated_at : ${_task.updatedAt.format()}',
                  style: const TextStyle(fontSize: 12),
                ),
              ),*/
              blank,
              DeleteButton(
                () => context.push('/list/edit/delete', extra: _task.id),
                '予定を削除',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
