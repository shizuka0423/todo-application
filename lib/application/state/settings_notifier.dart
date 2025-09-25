import 'package:flutter_todo_application/domain/types/app_settings.dart';
import 'package:flutter_todo_application/infrastructure/databases/settings_shared_prefs.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final settingsProvider = NotifierProvider<SettingsNotifier, AppSettings>(
  SettingsNotifier.new,
);

class SettingsNotifier extends Notifier<AppSettings> {
  //watchは使わない??
  late final preferences = ref.read(sharedPreferencesProvider);
  late final prefService = SharedPrefService(preferences);

  @override
  AppSettings build() {
    return prefService.fromSharedPreferences();
  }

  Future<void> updateDarkMode(bool isDark) async {
    state = state.copyWith(darkMode: isDark);
    await prefService.saveDarkMode(isDark);
  }

  void updateFontFamily(String font) async {
    state = state.copyWith(fontFamily: font);
    await prefService.saveFontFamily(font);
  }

  void updateFontSize(double size) async {
    state = state.copyWith(fontSize: size);
    await prefService.saveFontSize(size);
  }

  void updatePrimaryColor(int color) async {
    state = state.copyWith(primaryColor: color);
    await prefService.savePrimaryColor(color);
  }
}
