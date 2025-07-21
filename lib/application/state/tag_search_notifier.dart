import 'package:flutter_todo_application/application/state/tag_notifier.dart';
import 'package:flutter_todo_application/domain/types/tag.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tag_search_notifier.g.dart';

@riverpod
class TagSearchNotifier extends _$TagSearchNotifier {
  @override
  List<Tag> build() => ref.read(tagNotifierProvider.notifier).resetTag();

  void tagSearch(String keyword) {
    state = ref.read(tagNotifierProvider.notifier).resetTag();
    state = state.where((tag) => tag.name.contains(keyword)).toList();
  }

  /*Future<void> tagLoadAll() async {
    state = await ref.read(todoRepositoryProvider).tagLoadAll();
  }*/
}
