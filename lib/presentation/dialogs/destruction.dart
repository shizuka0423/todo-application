import 'package:flutter/material.dart';
import 'package:flutter_todo_application/application/state/edit_notifier.dart';
import 'package:flutter_todo_application/presentation/router/routes.dart';
import 'package:flutter_todo_application/presentation/theme/radius_styles.dart';
import 'package:flutter_todo_application/presentation/theme/text_styles.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DestructionDialog extends ConsumerWidget {
  const DestructionDialog({super.key});

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
                child: Text('変更を破棄しますか？', style: AppText.bodyM),
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
                    child: const Text("続ける"),
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
                    onPressed: () {},
                    child: Text("破棄する", style: TextStyle(color: Colors.red)),
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
