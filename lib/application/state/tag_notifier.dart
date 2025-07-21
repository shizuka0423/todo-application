import 'package:flutter_todo_application/domain/types/tag.dart';
import 'package:flutter_todo_application/infrastructure/repository/todo_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tag_notifier.g.dart';

@riverpod
class TagNotifier extends _$TagNotifier {
  @override
  List<Tag> build() => [];

  Future<void> loadAllTag() async {
    state = await ref.read(todoRepositoryProvider).tagLoadAll();
  }

  List<Tag> resetTag() {
    return state;
  }

  void addTag(Tag tag) => state = <Tag>[...state, tag];

  void updateTag(Tag tag) =>
      state = state.map((t) => (t.id == tag.id) ? tag : t).toList();

  void deleteTag(String id) => state = state.where((t) => t.id != id).toList();

  /*Future<void> tagLoadAll() async {
    state = await ref.read(todoRepositoryProvider).tagLoadAll();
  }*/
}
