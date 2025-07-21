import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_settings.freezed.dart';

@freezed
class AppSettings with _$AppSettings {
  factory AppSettings({
    required bool darkMode,
    required String fontFamily,
    required double fontSize,
    required int primaryColor,
  }) = _AppSettings;
}
