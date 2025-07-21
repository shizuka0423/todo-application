import 'package:flutter/material.dart';
import 'package:flutter_todo_application/application/state/tag_notifier.dart';
import 'package:flutter_todo_application/presentation/theme/colors.dart';
import 'package:flutter_todo_application/presentation/theme/icons.dart';
import 'package:flutter_todo_application/presentation/widgets/no_task_image.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TagListScreen extends ConsumerWidget {
  const TagListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tags = ref.watch(tagNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('ラベル'),
        actions: [
          IconButton(
            onPressed: () => context.push('/list/tagList/tagRegistration'),
            icon: AppIcons.add,
          ),
        ],
      ),
      body:
          tags.isNotEmpty
              ? SingleChildScrollView(
                child: Column(
                  children: List.generate(tags.length, (index) {
                    final tag = tags[index];
                    final labelColor = _getLabelColorIndex(tag.color);
                    return ListTile(
                      leading: Icon(IconDatas.tag, color: Color(labelColor)),
                      title: Text(tag.name),
                      onTap:
                          () =>
                              context.push('/list/tagList/tagEdit', extra: tag),
                    );
                  }),
                ),
              )
              : NoTaskImage(),
      // floatingActionButton: FloatingActionButton(
      //   foregroundColor: Theme.of(context).colorScheme.surface,
      //   child: AppIcons.add,
      //   onPressed: () => context.push('/list/tagList/tagRegistration'),
      // ),
    );
  }

  int _getLabelColorIndex(int color) {
    final index = TagColors.values.indexWhere((e) => e.color == color);
    return index != -1 ? index : 0;
  }
}
