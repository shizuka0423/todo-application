import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_application/application/state/settings_notifier.dart';
import 'package:flutter_todo_application/presentation/theme/colors.dart';
import 'package:flutter_todo_application/presentation/theme/decorations.dart';
import 'package:flutter_todo_application/presentation/theme/text_styles.dart';
import 'package:flutter_todo_application/presentation/widgets/slivers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsThemeScreen extends HookConsumerWidget {
  const SettingsThemeScreen(this._isDarkMode, this._primaryColor, {super.key});
  final bool _isDarkMode;
  final int _primaryColor;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = useState<bool>(_isDarkMode);
    final initialIndex = _getPrimaryColorIndex();
    final selectedColorIndex = useState<int>(initialIndex);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('テーマカラー・ダークモード設定', style: AppText.appBarStyle),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              ListTile(
                title: Text("ダークモード"),
                trailing: CupertinoSwitch(
                  value: isDarkMode.value,
                  onChanged: (value) {
                    isDarkMode.value = value;
                    ref.read(settingsProvider.notifier).updateDarkMode(value);
                    final color = _getPrimaryColorCode(
                      selectedColorIndex.value,
                      value,
                    );
                    ref
                        .read(settingsProvider.notifier)
                        .updatePrimaryColor(color);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 0,
                    width: MediaQuery.of(context).size.width * 0.95,
                    child: Divider(thickness: 0),
                  ),
                ],
              ),
            ]),
          ),
          sliverTitle('テーマカラー設定'),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(24, 0, 24, 24),
            sliver: DecoratedSliver(
              decoration: customBoxDecoration, // 背景装飾
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  final color = _getPrimaryColorCode(index, isDarkMode.value);
                  final isSelectedColor = selectedColorIndex.value == index;
                  return GestureDetector(
                    onTap: () {
                      selectedColorIndex.value = index;
                      ref
                          .read(settingsProvider.notifier)
                          .updatePrimaryColor(color);
                    },
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: Color(color),
                        shape: BoxShape.circle,
                      ),

                      child:
                          isSelectedColor
                              ? Center(child: Icon(Icons.check_rounded))
                              : SizedBox.shrink(),
                    ),
                  );
                }, childCount: MyThemeColors.values.length),
              ),
            ),
          ),
        ],
      ),
      /*SettingsList(
        sections: [
          SettingsSection(
            tiles: [
              SettingsTile.switchTile(
                title: Text('ダークモード'),
                initialValue: checked.value,
                onToggle: (value) {
                  checked.value = value;
                  ref.read(settingsProvider.notifier).updateDarkMode(value);
                },
              ),
            ],
          ),
          SettingsSection(tiles: []),
        ],
      ),*/
    );
  }

  int _getPrimaryColorIndex() {
    final index = MyThemeColors.values.indexWhere(
      (e) => (_isDarkMode ? e.dark : e.light) == _primaryColor,
    );
    return index != -1 ? index : 0;
  }

  int _getPrimaryColorCode(int index, bool isDarkMode) {
    final colors = MyThemeColors.values;
    return isDarkMode ? colors[index].dark : colors[index].light;
  }
}
