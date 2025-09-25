import 'package:flutter/material.dart';
import 'package:flutter_todo_application/presentation/theme/text_styles.dart';

class NoTaskImage extends StatelessWidget {
  const NoTaskImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.sticky_note_2_outlined, size: 42),
          SizedBox(height: 10),
          Text('No task...', style: AppText.bodyM),
        ],
      ),
    );
  }
}
