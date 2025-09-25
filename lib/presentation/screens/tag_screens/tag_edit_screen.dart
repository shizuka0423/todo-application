import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_application/application/state/list_notifier.dart';
import 'package:flutter_todo_application/domain/types/tag.dart';
import 'package:flutter_todo_application/presentation/theme/colors.dart';
import 'package:flutter_todo_application/presentation/theme/radius_styles.dart';
import 'package:flutter_todo_application/presentation/theme/text_styles.dart';
import 'package:flutter_todo_application/presentation/widgets/buttons.dart';
import 'package:flutter_todo_application/presentation/widgets/color_pallet.dart';
import 'package:flutter_todo_application/presentation/widgets/dropdown_tiles.dart';
import 'package:flutter_todo_application/presentation/widgets/list_tiles.dart';
import 'package:flutter_todo_application/presentation/widgets/text_fields.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TagEditSheet extends HookConsumerWidget {
  const TagEditSheet(this._tag, {super.key});

  final Tag _tag;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useTextEditingController(text: _tag.name);

    final initialIndex = _getLabelColorIndex();
    final selectedColorIndex = useState<int>(initialIndex);

    final isLoading = useState<bool>(true);
    final isValid = useState<bool>(true);

    useEffect(() {
      titleController.addListener(() {
        //何も変えてないときはどうするか
        isValid.value = titleController.text.isNotEmpty;
      });
      return null;
    }, const []);

    return SizedBox(
      child: Column(
        children: [
          AppBar(
            shape: RoundedRectangleBorder(borderRadius: AppRadius.appBar),
            centerTitle: true,
            title: Text("ラベルを編集", style: AppText.appBarM),
            leading: TextButton(
              //dialogかつ個別
              onPressed: () => context.pop(),
              child: const Text('キャンセル'),
            ),
            leadingWidth: 100,
            actions: [
              TextButton(
                onPressed:
                    isValid.value
                        ? () async {
                          isLoading.value = true;
                          final selectedColor =
                              TagColors.values[selectedColorIndex.value].color;
                          final notifier = ref.read(
                            listNotifierProvider.notifier,
                          );
                          final updated = _tag.copyWith(
                            name: titleController.text,
                            color: selectedColor,
                            favorite: 0,
                          );
                          await notifier.updateTag(updated);
                          isLoading.value = false;

                          if (context.mounted) {
                            context.pop();
                          }
                        }
                        : null,
                child: Text('完了'),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(6, 16, 6, 16),
            child: Column(
              children: [
                TitleTextField(titleController),
                const SizedBox(height: 16),
                TagColorTile(selectedColorIndex.value),
                ColorPalletPicker(
                  selectedColorIndex.value,
                  (index) => selectedColorIndex.value = index,
                ),
                const SizedBox(height: 16),
                DeleteButton(
                  () => context.push(
                    '/list/tagList/tagEdit/tagDelete',
                    extra: _tag.id,
                  ),
                  'ラベルを削除',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int _getLabelColorIndex() {
    final index = TagColors.values.indexWhere((e) => e.color == _tag.color);
    return index != -1 ? index : 0;
  }
}
