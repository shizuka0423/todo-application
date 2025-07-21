import 'package:flutter/material.dart';
import 'package:flutter_todo_application/application/state/settings_notifier.dart';
import 'package:flutter_todo_application/domain/types/settings_element.dart';
import 'package:flutter_todo_application/presentation/theme/text_styles.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:tuple/tuple.dart';

class SettingsScreen extends HookConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sets = ref.watch(settingsProvider);
    final section = SettingsSections.values;
    final setSection = section[0];
    final otherSection = section[1];

    //final taskState = ref.watch(taskAsyncNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('設定', style: AppText.appBarStyle),
      ),
      body: SettingsList(
        platform: DevicePlatform.iOS,
        sections: [
          SettingsSection(
            title: Text(setSection.name),
            tiles: [
              SettingsTile.navigation(
                title: Text(setSection.items[0].title),
                onPressed:
                    (context) => context.push(
                      setSection.items[0].path,
                      extra: Tuple2(sets.darkMode, sets.primaryColor),
                    ),
              ),
              SettingsTile.navigation(
                title: Text(setSection.items[1].title),
                onPressed: (context) {},
              ),
              SettingsTile.navigation(
                title: Text(setSection.items[2].title),
                onPressed: (context) {},
              ),
            ],
          ),
          SettingsSection(
            title: Text(otherSection.name),
            tiles: [
              SettingsTile.navigation(
                title: Text(otherSection.items[0].title),
                onPressed: (context) {},
              ),
              SettingsTile.navigation(
                title: Text(otherSection.items[1].title),
                onPressed: (context) {},
              ),
              SettingsTile.navigation(
                title: Text(otherSection.items[2].title),
                onPressed: (context) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/*CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: RawSize.p24,
            ),
            sliver: SliverToBoxAdapter(
              child: Text(setSection.name, style: AppText.bodyS),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
            sliver: DecoratedSliver(
              decoration: customBoxDecoration, // 背景装飾
              sliver: SliverFixedExtentList(
                itemExtent: 45,
                delegate: SliverChildBuilderDelegate((
                  BuildContext context,
                  int index,
                ) {
                  final item = setSection.items[index];
                  return Column(
                    children: [
                      SimpleListTile(item),
                      if (index < setSection.items.length - 1) CustomDivider(),
                    ],
                  );
                }, childCount: setSection.items.length),
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: RawSize.p24,
            ),
            sliver: SliverToBoxAdapter(
              child: Text(otherSection.name, style: AppText.bodyS),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
            sliver: DecoratedSliver(
              decoration: customBoxDecoration, // 背景装飾
              sliver: SliverFixedExtentList(
                itemExtent: 45,
                delegate: SliverChildBuilderDelegate((
                  BuildContext context,
                  int index,
                ) {
                  final item = otherSection.items[index];
                  return Column(
                    children: [
                      SimpleListTile(item),
                      if (index < otherSection.items.length - 1)
                        CustomDivider(),
                    ],
                  );
                }, childCount: otherSection.items.length),
              ),
            ),
          ),
        ],
      ),*/
/*SettingsList(
        sections: [
          SettingsSection(
            title: Text(setSection.name),
            tiles: [
              SettingsTile.navigation(
                title: Text(setSection.items[0].title),
                onPressed:
                    (context) => context.push(
                      setSection.items[0].path,
                      extra: sets.darkMode,
                    ),
              ),
            ],
          ),
        ],
      ),*/
