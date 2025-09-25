import 'package:flutter/material.dart';
import 'package:flutter_todo_application/presentation/theme/radius_styles.dart';
import 'package:flutter_todo_application/presentation/theme/text_styles.dart';
import 'package:go_router/go_router.dart';

class ConfirmBackDialog extends StatelessWidget {
  const ConfirmBackDialog({super.key});
  @override
  Widget build(BuildContext context) {
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
                child: Text('編集中の内容を破棄しますか？', style: AppText.bodyM),
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
                    onPressed: () {
                      for (int i = 0; i < 2; i++) {
                        context.pop();
                      }
                    },
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
