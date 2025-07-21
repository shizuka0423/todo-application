import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_todo_application/application/config/notification_service.dart';
import 'package:flutter_todo_application/application/state/settings_notifier.dart';
import 'package:flutter_todo_application/infrastructure/databases/settings_shared_prefs.dart';
import 'package:flutter_todo_application/presentation/router/route_navigator.dart';
import 'package:flutter_todo_application/presentation/theme/app_themes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  final startTime = DateTime.now();
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().initialize();

  final preferences = await SharedPreferences.getInstance();

  await initializeDateFormatting('ja_JP').then((_) {
    runApp(
      ProviderScope(
        overrides: [sharedPreferencesProvider.overrideWithValue(preferences)],
        child: MyApp(),
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final endTime = DateTime.now();
      debugPrint('アプリ起動時間: ${endTime.difference(startTime).inMilliseconds} ms');
    });
  });
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final setsData = ref.watch(settingsProvider);

    return MaterialApp.router(
      title: 'Flutter Demo',
      /*theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),*/
      debugShowCheckedModeBanner: false,
      theme: appLightTheme(setsData.primaryColor),
      darkTheme: appDarkTheme(setsData.primaryColor),
      themeMode: setsData.darkMode ? ThemeMode.dark : ThemeMode.light,
      routerConfig: router,
    );
  }
}
