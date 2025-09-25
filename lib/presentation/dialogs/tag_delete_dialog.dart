import 'package:flutter/material.dart';
import 'package:flutter_todo_application/application/state/list_notifier.dart';
import 'package:flutter_todo_application/presentation/theme/radius_styles.dart';
import 'package:flutter_todo_application/presentation/theme/text_styles.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TagDeleteDialog extends ConsumerWidget {
  const TagDeleteDialog(this._tagId, {super.key});

  final String _tagId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double width = 300;
    final double height = 140;
    final double messageHeight = 90;
    final double buttonWidth = width / 2;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: AppRadius.all),
      child: SizedBox(
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: width,
              height: messageHeight,
              child: const Center(
                child: Text('ラベルを削除しますか？', style: AppText.bodyM),
              ),
            ),
            Divider(height: 0, thickness: 0),
            Expanded(
              child: Row(
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: Size(buttonWidth, height - messageHeight),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                        ),
                      ),
                    ),
                    onPressed: () => context.pop(),
                    child: const Text("キャンセル"),
                  ),
                  VerticalDivider(width: 0, thickness: 0),
                  TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: Size(buttonWidth, height - messageHeight),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(8),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      await ref
                          .read(listNotifierProvider.notifier)
                          .deleteTag(_tagId);
                      if (context.mounted) {
                        for (int i = 0; i < 2; i++) {
                          context.pop();
                        }
                      }
                    },
                    child: Text("削除する", style: TextStyle(color: Colors.red)),
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
