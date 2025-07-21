import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_application/application/state/edit_notifier.dart';
import 'package:flutter_todo_application/domain/types/sub_task.dart';
import 'package:flutter_todo_application/presentation/theme/radius_styles.dart';
import 'package:flutter_todo_application/presentation/widgets/text_fields.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SubTaskEditSheet extends HookConsumerWidget {
  const SubTaskEditSheet(this._subTask, {super.key});
  final SubTask _subTask;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useTextEditingController(text: _subTask.title);
    final isValid = useState<bool>(false);
    final isLoading = useState<bool>(false);

    useEffect(() {
      titleController.addListener(() {
        isValid.value = titleController.text.isNotEmpty && !isLoading.value;
      });
      return null;
    }, const []);

    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.5,
      child: Column(
        children: [
          AppBar(
            shape: const RoundedRectangleBorder(borderRadius: AppRadius.appBar),
            leadingWidth: 100,
            leading: TextButton(
              child: const Text('キャンセル'),
              onPressed: () => context.pop(),
            ),
            title: const Text('やることを編集'),
            actions: [
              TextButton(
                onPressed:
                    isValid.value
                        ? () async {
                          isLoading.value = true;
                          final notifier = ref.read(
                            editNotifierProvider.notifier,
                          );
                          final updated = _subTask.copyWith(
                            title: titleController.text,
                          );
                          await notifier.updateSubTask(updated);
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
          const SizedBox(height: 12),
          SubTaskTextField(titleController),
        ],
      ),
    );
  }
}
