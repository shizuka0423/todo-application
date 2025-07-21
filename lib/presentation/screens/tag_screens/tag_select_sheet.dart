import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_application/domain/types/tag.dart';
import 'package:flutter_todo_application/presentation/theme/colors.dart';
import 'package:flutter_todo_application/presentation/theme/icons.dart';
import 'package:flutter_todo_application/presentation/theme/radius_styles.dart';
import 'package:flutter_todo_application/presentation/theme/sizes.dart';
import 'package:flutter_todo_application/presentation/widgets/list_tiles.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TagSelectSheet extends HookConsumerWidget {
  const TagSelectSheet(this._tags, this._selected, {super.key});

  final List<Tag> _tags;
  final String? _selected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onSelected = useState<String?>(_selected);

    return SizedBox(
      child: Column(
        children: [
          AppBar(
            shape: RoundedRectangleBorder(borderRadius: AppRadius.appBar),
            leading: TextButton(
              onPressed: () => context.pop(),
              child: const Text('キャンセル'),
            ),
            leadingWidth: 100,
            title: Text('ラベルを選択'),
            centerTitle: true,
            actions: [
              TextButton(
                onPressed: () => context.pop(onSelected.value),
                child: const Text('完了'),
              ),
            ],
          ),
          /*TextField(
            //style: TextStyle(color: Colors.white),
            //cursorColor: Colors.white,
            textAlignVertical: TextAlignVertical.center,
            //scrollPadding: EdgeInsets.all(0),
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).colorScheme.onSecondary,
              prefixIcon:
                  //alignment: Alignment.center,
                  AppIcons.search, // ← あなたのカスタムアイコン

              prefixIconConstraints: BoxConstraints(
                minWidth: 48,
                minHeight: 48,
              ),
              hintText: '検索',
              contentPadding: EdgeInsets.fromLTRB(4, 4, 4, 4),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              //hintStyle: Theme.of(context).textTheme.bodyMedium,
              isDense: true,
            ),

            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.search,
            onChanged: (keyword) {
              ref.read(tagSearchNotifierProvider.notifier).tagSearch(keyword);
            },
          ),*/
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 16),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(6, 10, 6, 10),
                      child: DefaultTagTile(
                        () => onSelected.value = null,
                        onSelected.value,
                      ),
                    ),
                    ...List.generate(_tags.length, (index) {
                      final tag = _tags[index];
                      return Padding(
                        padding: EdgeInsets.fromLTRB(6, 10, 6, 10),
                        child: TagSelectTile(
                          () => onSelected.value = tag.id,
                          tag,
                          onSelected.value,
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      /*CustomScrollView(
        child: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            title: TextField(
              //style: TextStyle(color: Colors.white),
              //cursorColor: Colors.white,
              textAlignVertical: TextAlignVertical.center,
              //scrollPadding: EdgeInsets.all(0),
              decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).colorScheme.onSecondary,
                prefixIcon:
                    //alignment: Alignment.center,
                    AppIcons.search, // ← あなたのカスタムアイコン

                prefixIconConstraints: BoxConstraints(
                  minWidth: 30,
                  minHeight: 32,
                ),
                hintText: '検索',
                contentPadding: EdgeInsets.fromLTRB(4, 4, 4, 4),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                //hintStyle: Theme.of(context).textTheme.bodyMedium,
                isDense: true,
              ),

              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              onChanged: (keyword) async {
                /*isLoading.value = true;
            await ref.read(todoListViewModelProvider.notifier).search(keyword);
            isLoading.value = false;*/
              },
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((
              BuildContext context,
              int index,
            ) {
              return ListTile(title: Text(_tags[index + 1].name));
            }, childCount: _tags.length - 1),
          ),
        ],
      ),*/
    );
  }
}
/*TextField(
          //style: TextStyle(color: Colors.white),
          //cursorColor: Colors.white,
          textAlignVertical: TextAlignVertical.center,
          //scrollPadding: EdgeInsets.all(0),
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).colorScheme.onSecondary,
            prefixIcon:
                //alignment: Alignment.center,
                AppIcons.search, // ← あなたのカスタムアイコン

            prefixIconConstraints: BoxConstraints(minWidth: 30, minHeight: 32),
            hintText: '検索',
            contentPadding: EdgeInsets.fromLTRB(4, 4, 4, 4),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            //hintStyle: Theme.of(context).textTheme.bodyMedium,
            isDense: true,
          ),

          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
          onChanged: (keyword) async {
            /*isLoading.value = true;
            await ref.read(todoListViewModelProvider.notifier).search(keyword);
            isLoading.value = false;*/
          },
        ),*/