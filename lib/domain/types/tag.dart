import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ulid/ulid.dart';

part 'tag.freezed.dart';
part 'tag.g.dart';

@freezed
class Tag with _$Tag {
  const factory Tag({
    required String id,
    required String name,
    required int color,
    required int favorite,
  }) = _Tag;

  factory Tag.fromJson(Map<String, Object?> json) => _$TagFromJson(json);

  factory Tag.create(String name, int color, int favorite) {
    return Tag(
      id: Ulid().toString(),
      name: name,
      color: color,
      favorite: favorite,
    );
  }
}
