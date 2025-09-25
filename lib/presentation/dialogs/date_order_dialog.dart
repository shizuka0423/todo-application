import 'package:flutter/material.dart';
import 'package:flutter_todo_application/presentation/theme/radius_styles.dart';
import 'package:flutter_todo_application/presentation/theme/text_styles.dart';
import 'package:go_router/go_router.dart';

class DateOrderDialog extends StatelessWidget {
  const DateOrderDialog({super.key});
  @override
  Widget build(BuildContext context) {
    final double width = 300;
    final double height = 140;
    final double messageHeight = 90;

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
                child: Text('終了日は開始日より前に設定できません', style: AppText.bodyM),
              ),
            ),
            Divider(height: 0, thickness: 0),
            TextButton(
              style: TextButton.styleFrom(
                minimumSize: Size(width, height - messageHeight),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(8),
                  ),
                ),
              ),
              onPressed: () => context.pop(),
              child: const Text("OK"),
            ),
          ],
        ),
      ),
    );
  }
}
