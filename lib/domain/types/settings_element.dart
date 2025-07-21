abstract class SettingsItem {
  String get title;
  String get path;
}

enum SettingsSections {
  sets('設定', SettingsSetsElement.values),
  others('その他', SettingsOthersElement.values);

  final String name;
  final List<SettingsItem> items;
  const SettingsSections(this.name, this.items);
}

enum SettingsSetsElement implements SettingsItem {
  themeSheet('テーマカラー・ダークモード設定', '/settings/theme'),
  languageSheet('言語・フォント設定', '/settings/language'),
  otherSheet('その他の設定', '/settings/other');

  @override
  final String title;
  @override
  final String path;

  const SettingsSetsElement(this.title, this.path);
}

enum SettingsOthersElement implements SettingsItem {
  guideSheet('便利な使い方', '/settings/guide'),
  questionSheet('よくある質問', '/settings/question'),
  appSheet('このアプリについて', '/settings/app');

  const SettingsOthersElement(this.title, this.path);
  @override
  final String title;
  @override
  final String path;
}

/*final Map<SettingsSection, List<dynamic>> settingsItems = {
  SettingsSection.sets: SettingsSetsElement.values,
  SettingsSection.others: SettingsOthersElement.values,
};*/
