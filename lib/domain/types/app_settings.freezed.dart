// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AppSettings {
  bool get darkMode => throw _privateConstructorUsedError;
  String get fontFamily => throw _privateConstructorUsedError;
  double get fontSize => throw _privateConstructorUsedError;
  int get primaryColor => throw _privateConstructorUsedError;

  /// Create a copy of AppSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppSettingsCopyWith<AppSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSettingsCopyWith<$Res> {
  factory $AppSettingsCopyWith(
    AppSettings value,
    $Res Function(AppSettings) then,
  ) = _$AppSettingsCopyWithImpl<$Res, AppSettings>;
  @useResult
  $Res call({
    bool darkMode,
    String fontFamily,
    double fontSize,
    int primaryColor,
  });
}

/// @nodoc
class _$AppSettingsCopyWithImpl<$Res, $Val extends AppSettings>
    implements $AppSettingsCopyWith<$Res> {
  _$AppSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? darkMode = null,
    Object? fontFamily = null,
    Object? fontSize = null,
    Object? primaryColor = null,
  }) {
    return _then(
      _value.copyWith(
            darkMode:
                null == darkMode
                    ? _value.darkMode
                    : darkMode // ignore: cast_nullable_to_non_nullable
                        as bool,
            fontFamily:
                null == fontFamily
                    ? _value.fontFamily
                    : fontFamily // ignore: cast_nullable_to_non_nullable
                        as String,
            fontSize:
                null == fontSize
                    ? _value.fontSize
                    : fontSize // ignore: cast_nullable_to_non_nullable
                        as double,
            primaryColor:
                null == primaryColor
                    ? _value.primaryColor
                    : primaryColor // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AppSettingsImplCopyWith<$Res>
    implements $AppSettingsCopyWith<$Res> {
  factory _$$AppSettingsImplCopyWith(
    _$AppSettingsImpl value,
    $Res Function(_$AppSettingsImpl) then,
  ) = __$$AppSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool darkMode,
    String fontFamily,
    double fontSize,
    int primaryColor,
  });
}

/// @nodoc
class __$$AppSettingsImplCopyWithImpl<$Res>
    extends _$AppSettingsCopyWithImpl<$Res, _$AppSettingsImpl>
    implements _$$AppSettingsImplCopyWith<$Res> {
  __$$AppSettingsImplCopyWithImpl(
    _$AppSettingsImpl _value,
    $Res Function(_$AppSettingsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? darkMode = null,
    Object? fontFamily = null,
    Object? fontSize = null,
    Object? primaryColor = null,
  }) {
    return _then(
      _$AppSettingsImpl(
        darkMode:
            null == darkMode
                ? _value.darkMode
                : darkMode // ignore: cast_nullable_to_non_nullable
                    as bool,
        fontFamily:
            null == fontFamily
                ? _value.fontFamily
                : fontFamily // ignore: cast_nullable_to_non_nullable
                    as String,
        fontSize:
            null == fontSize
                ? _value.fontSize
                : fontSize // ignore: cast_nullable_to_non_nullable
                    as double,
        primaryColor:
            null == primaryColor
                ? _value.primaryColor
                : primaryColor // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc

class _$AppSettingsImpl implements _AppSettings {
  _$AppSettingsImpl({
    required this.darkMode,
    required this.fontFamily,
    required this.fontSize,
    required this.primaryColor,
  });

  @override
  final bool darkMode;
  @override
  final String fontFamily;
  @override
  final double fontSize;
  @override
  final int primaryColor;

  @override
  String toString() {
    return 'AppSettings(darkMode: $darkMode, fontFamily: $fontFamily, fontSize: $fontSize, primaryColor: $primaryColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppSettingsImpl &&
            (identical(other.darkMode, darkMode) ||
                other.darkMode == darkMode) &&
            (identical(other.fontFamily, fontFamily) ||
                other.fontFamily == fontFamily) &&
            (identical(other.fontSize, fontSize) ||
                other.fontSize == fontSize) &&
            (identical(other.primaryColor, primaryColor) ||
                other.primaryColor == primaryColor));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, darkMode, fontFamily, fontSize, primaryColor);

  /// Create a copy of AppSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppSettingsImplCopyWith<_$AppSettingsImpl> get copyWith =>
      __$$AppSettingsImplCopyWithImpl<_$AppSettingsImpl>(this, _$identity);
}

abstract class _AppSettings implements AppSettings {
  factory _AppSettings({
    required final bool darkMode,
    required final String fontFamily,
    required final double fontSize,
    required final int primaryColor,
  }) = _$AppSettingsImpl;

  @override
  bool get darkMode;
  @override
  String get fontFamily;
  @override
  double get fontSize;
  @override
  int get primaryColor;

  /// Create a copy of AppSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppSettingsImplCopyWith<_$AppSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
