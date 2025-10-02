// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Task _$TaskFromJson(Map<String, dynamic> json) {
  return _Task.fromJson(json);
}

/// @nodoc
mixin _$Task {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'tag_id')
  String? get tagId => throw _privateConstructorUsedError;
  int get importance => throw _privateConstructorUsedError;
  int get progress => throw _privateConstructorUsedError;
  int get regularly => throw _privateConstructorUsedError;
  @JsonKey(name: 'repeat_count')
  int get repeatCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_at')
  DateTime? get startAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_at')
  DateTime? get endAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_reminder_minutes')
  int? get startReminderMinutes => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_reminder_minutes')
  int? get endReminderMinutes => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Task to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
  @useResult
  $Res call({
    String id,
    String title,
    String description,
    @JsonKey(name: 'tag_id') String? tagId,
    int importance,
    int progress,
    int regularly,
    @JsonKey(name: 'repeat_count') int repeatCount,
    @JsonKey(name: 'start_at') DateTime? startAt,
    @JsonKey(name: 'end_at') DateTime? endAt,
    @JsonKey(name: 'start_reminder_minutes') int? startReminderMinutes,
    @JsonKey(name: 'end_reminder_minutes') int? endReminderMinutes,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
  });
}

/// @nodoc
class _$TaskCopyWithImpl<$Res, $Val extends Task>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? tagId = freezed,
    Object? importance = null,
    Object? progress = null,
    Object? regularly = null,
    Object? repeatCount = null,
    Object? startAt = freezed,
    Object? endAt = freezed,
    Object? startReminderMinutes = freezed,
    Object? endReminderMinutes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            title:
                null == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String,
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
            tagId:
                freezed == tagId
                    ? _value.tagId
                    : tagId // ignore: cast_nullable_to_non_nullable
                        as String?,
            importance:
                null == importance
                    ? _value.importance
                    : importance // ignore: cast_nullable_to_non_nullable
                        as int,
            progress:
                null == progress
                    ? _value.progress
                    : progress // ignore: cast_nullable_to_non_nullable
                        as int,
            regularly:
                null == regularly
                    ? _value.regularly
                    : regularly // ignore: cast_nullable_to_non_nullable
                        as int,
            repeatCount:
                null == repeatCount
                    ? _value.repeatCount
                    : repeatCount // ignore: cast_nullable_to_non_nullable
                        as int,
            startAt:
                freezed == startAt
                    ? _value.startAt
                    : startAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            endAt:
                freezed == endAt
                    ? _value.endAt
                    : endAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            startReminderMinutes:
                freezed == startReminderMinutes
                    ? _value.startReminderMinutes
                    : startReminderMinutes // ignore: cast_nullable_to_non_nullable
                        as int?,
            endReminderMinutes:
                freezed == endReminderMinutes
                    ? _value.endReminderMinutes
                    : endReminderMinutes // ignore: cast_nullable_to_non_nullable
                        as int?,
            createdAt:
                null == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            updatedAt:
                null == updatedAt
                    ? _value.updatedAt
                    : updatedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TaskImplCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$TaskImplCopyWith(
    _$TaskImpl value,
    $Res Function(_$TaskImpl) then,
  ) = __$$TaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String description,
    @JsonKey(name: 'tag_id') String? tagId,
    int importance,
    int progress,
    int regularly,
    @JsonKey(name: 'repeat_count') int repeatCount,
    @JsonKey(name: 'start_at') DateTime? startAt,
    @JsonKey(name: 'end_at') DateTime? endAt,
    @JsonKey(name: 'start_reminder_minutes') int? startReminderMinutes,
    @JsonKey(name: 'end_reminder_minutes') int? endReminderMinutes,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
  });
}

/// @nodoc
class __$$TaskImplCopyWithImpl<$Res>
    extends _$TaskCopyWithImpl<$Res, _$TaskImpl>
    implements _$$TaskImplCopyWith<$Res> {
  __$$TaskImplCopyWithImpl(_$TaskImpl _value, $Res Function(_$TaskImpl) _then)
    : super(_value, _then);

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? tagId = freezed,
    Object? importance = null,
    Object? progress = null,
    Object? regularly = null,
    Object? repeatCount = null,
    Object? startAt = freezed,
    Object? endAt = freezed,
    Object? startReminderMinutes = freezed,
    Object? endReminderMinutes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$TaskImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        title:
            null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
        tagId:
            freezed == tagId
                ? _value.tagId
                : tagId // ignore: cast_nullable_to_non_nullable
                    as String?,
        importance:
            null == importance
                ? _value.importance
                : importance // ignore: cast_nullable_to_non_nullable
                    as int,
        progress:
            null == progress
                ? _value.progress
                : progress // ignore: cast_nullable_to_non_nullable
                    as int,
        regularly:
            null == regularly
                ? _value.regularly
                : regularly // ignore: cast_nullable_to_non_nullable
                    as int,
        repeatCount:
            null == repeatCount
                ? _value.repeatCount
                : repeatCount // ignore: cast_nullable_to_non_nullable
                    as int,
        startAt:
            freezed == startAt
                ? _value.startAt
                : startAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        endAt:
            freezed == endAt
                ? _value.endAt
                : endAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        startReminderMinutes:
            freezed == startReminderMinutes
                ? _value.startReminderMinutes
                : startReminderMinutes // ignore: cast_nullable_to_non_nullable
                    as int?,
        endReminderMinutes:
            freezed == endReminderMinutes
                ? _value.endReminderMinutes
                : endReminderMinutes // ignore: cast_nullable_to_non_nullable
                    as int?,
        createdAt:
            null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        updatedAt:
            null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskImpl implements _Task {
  const _$TaskImpl({
    required this.id,
    required this.title,
    this.description = "",
    @JsonKey(name: 'tag_id') this.tagId,
    required this.importance,
    this.progress = 0,
    required this.regularly,
    @JsonKey(name: 'repeat_count') required this.repeatCount,
    @JsonKey(name: 'start_at') this.startAt,
    @JsonKey(name: 'end_at') this.endAt,
    @JsonKey(name: 'start_reminder_minutes') this.startReminderMinutes,
    @JsonKey(name: 'end_reminder_minutes') this.endReminderMinutes,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'updated_at') required this.updatedAt,
  });

  factory _$TaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey(name: 'tag_id')
  final String? tagId;
  @override
  final int importance;
  @override
  @JsonKey()
  final int progress;
  @override
  final int regularly;
  @override
  @JsonKey(name: 'repeat_count')
  final int repeatCount;
  @override
  @JsonKey(name: 'start_at')
  final DateTime? startAt;
  @override
  @JsonKey(name: 'end_at')
  final DateTime? endAt;
  @override
  @JsonKey(name: 'start_reminder_minutes')
  final int? startReminderMinutes;
  @override
  @JsonKey(name: 'end_reminder_minutes')
  final int? endReminderMinutes;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Task(id: $id, title: $title, description: $description, tagId: $tagId, importance: $importance, progress: $progress, regularly: $regularly, repeatCount: $repeatCount, startAt: $startAt, endAt: $endAt, startReminderMinutes: $startReminderMinutes, endReminderMinutes: $endReminderMinutes, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.tagId, tagId) || other.tagId == tagId) &&
            (identical(other.importance, importance) ||
                other.importance == importance) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.regularly, regularly) ||
                other.regularly == regularly) &&
            (identical(other.repeatCount, repeatCount) ||
                other.repeatCount == repeatCount) &&
            (identical(other.startAt, startAt) || other.startAt == startAt) &&
            (identical(other.endAt, endAt) || other.endAt == endAt) &&
            (identical(other.startReminderMinutes, startReminderMinutes) ||
                other.startReminderMinutes == startReminderMinutes) &&
            (identical(other.endReminderMinutes, endReminderMinutes) ||
                other.endReminderMinutes == endReminderMinutes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    description,
    tagId,
    importance,
    progress,
    regularly,
    repeatCount,
    startAt,
    endAt,
    startReminderMinutes,
    endReminderMinutes,
    createdAt,
    updatedAt,
  );

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      __$$TaskImplCopyWithImpl<_$TaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskImplToJson(this);
  }
}

abstract class _Task implements Task {
  const factory _Task({
    required final String id,
    required final String title,
    final String description,
    @JsonKey(name: 'tag_id') final String? tagId,
    required final int importance,
    final int progress,
    required final int regularly,
    @JsonKey(name: 'repeat_count') required final int repeatCount,
    @JsonKey(name: 'start_at') final DateTime? startAt,
    @JsonKey(name: 'end_at') final DateTime? endAt,
    @JsonKey(name: 'start_reminder_minutes') final int? startReminderMinutes,
    @JsonKey(name: 'end_reminder_minutes') final int? endReminderMinutes,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
    @JsonKey(name: 'updated_at') required final DateTime updatedAt,
  }) = _$TaskImpl;

  factory _Task.fromJson(Map<String, dynamic> json) = _$TaskImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  @JsonKey(name: 'tag_id')
  String? get tagId;
  @override
  int get importance;
  @override
  int get progress;
  @override
  int get regularly;
  @override
  @JsonKey(name: 'repeat_count')
  int get repeatCount;
  @override
  @JsonKey(name: 'start_at')
  DateTime? get startAt;
  @override
  @JsonKey(name: 'end_at')
  DateTime? get endAt;
  @override
  @JsonKey(name: 'start_reminder_minutes')
  int? get startReminderMinutes;
  @override
  @JsonKey(name: 'end_reminder_minutes')
  int? get endReminderMinutes;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
