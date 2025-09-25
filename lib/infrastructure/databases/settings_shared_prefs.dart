import 'package:flutter_todo_application/domain/types/app_settings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>(
  (ref) => throw UnimplementedError(),
);

class SharedPrefService {
  final SharedPreferences preferences;
  SharedPrefService(this.preferences);

  AppSettings fromSharedPreferences() {
    return AppSettings(
      darkMode: preferences.getBool('darkMode') ?? false,
      fontFamily: preferences.getString('fontFamily') ?? 'Default',
      fontSize: preferences.getDouble('fontSize') ?? 16.0,
      primaryColor: preferences.getInt('primaryColor') ?? 0,
    );
  }

  Future<void> saveDarkMode(bool darkMode) async {
    await preferences.setBool('darkMode', darkMode);
  }

  Future<void> saveFontFamily(String fontFamily) async {
    await preferences.setString('fontFamily', fontFamily);
  }

  Future<void> saveFontSize(double fontSize) async {
    await preferences.setDouble('fontSize', fontSize);
  }

  Future<void> savePrimaryColor(int primaryColor) async {
    await preferences.setInt('primaryColor', primaryColor);
  }

  /*Future<bool> loadDarkMode() async {
    return await _asyncPrefs.getBool('darkMode') ?? false;
  }

  Future<void> cleanAll() async {
    await _asyncPrefs.clear();
  }*/
}
