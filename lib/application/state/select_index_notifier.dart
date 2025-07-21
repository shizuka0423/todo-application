import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'select_index_notifier.g.dart';

@riverpod
class SelectIndexNotifier extends _$SelectIndexNotifier {
  @override
  int build() {
    return 1;
  }

  void indexChanged(int index) {
    state = index;
  }
}
