import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_application/application/state/list_notifier.dart';
import 'package:flutter_todo_application/presentation/theme/colors.dart';
import 'package:flutter_todo_application/presentation/theme/radius_styles.dart';
import 'package:flutter_todo_application/presentation/theme/text_styles.dart';
import 'package:flutter_todo_application/presentation/widgets/color_pallet.dart';
import 'package:flutter_todo_application/presentation/widgets/list_tiles.dart';
import 'package:flutter_todo_application/presentation/widgets/text_fields.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TagRegistrationSheet extends HookConsumerWidget {
  const TagRegistrationSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState<bool>(false);
    final isValid = useState<bool>(false);

    final titleController = useTextEditingController();
    final selectedColorIndex = useState<int>(0);
    final isFavorite = useState<int>(0);

    useEffect(() {
      titleController.addListener(() {
        isValid.value = titleController.text.isNotEmpty && !isLoading.value;
      });
      return null;
    }, const []);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;
        if (isValid.value) {
          context.push('/list/tagList/tagRegistration/ConfirmBack');
        } else {
          context.pop();
        }
      },
      child: SizedBox(
        child: Column(
          children: [
            AppBar(
              //backgroundColor: Theme.of(context).colorScheme.primary,
              shape: RoundedRectangleBorder(borderRadius: AppRadius.appBar),
              centerTitle: true,
              title: Text("新しいラベル", style: AppText.appBarM),
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
                                TagColors
                                    .values[selectedColorIndex.value]
                                    .color;
                            final notifier = ref.read(
                              listNotifierProvider.notifier,
                            );
                            await notifier.createTag(
                              titleController.text,
                              selectedColor,
                              isFavorite.value,
                            );
                            isLoading.value = false;
                            if (context.mounted) {
                              context.pop();
                            }
                          }
                          : null,
                  child: const Text('完了'),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  TitleTextField(titleController),
                  const SizedBox(height: 16),
                  TagColorTile(selectedColorIndex.value),
                  ColorPalletPicker(
                    selectedColorIndex.value,
                    (index) => selectedColorIndex.value = index,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
