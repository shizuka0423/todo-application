import 'package:flutter/material.dart';
import 'package:flutter_todo_application/domain/types/sub_task.dart';
import 'package:flutter_todo_application/domain/types/tag.dart';
import 'package:flutter_todo_application/domain/types/task.dart';
import 'package:flutter_todo_application/presentation/dialogs/confirm_back_dialog.dart';
import 'package:flutter_todo_application/presentation/dialogs/date_order_dialog.dart';
import 'package:flutter_todo_application/presentation/dialogs/tag_delete_dialog.dart';
import 'package:flutter_todo_application/presentation/router/bottom_sheet_page.dart';
import 'package:flutter_todo_application/presentation/dialogs/delete_dialog.dart';
import 'package:flutter_todo_application/presentation/router/dialog_page.dart';
import 'package:flutter_todo_application/presentation/router/layout_scaffold.dart';
import 'package:flutter_todo_application/presentation/router/routes.dart';
import 'package:flutter_todo_application/presentation/screens/edit_screen.dart';
import 'package:flutter_todo_application/presentation/screens/home_screen.dart';
import 'package:flutter_todo_application/presentation/screens/list_screen.dart';
import 'package:flutter_todo_application/presentation/screens/registration_sheet.dart';
import 'package:flutter_todo_application/presentation/screens/settings_screens/settings_theme_screen.dart';
import 'package:flutter_todo_application/presentation/screens/settings_screen.dart';
import 'package:flutter_todo_application/presentation/screens/sub_task_screens/sub_task_registration_sheet.dart';
import 'package:flutter_todo_application/presentation/screens/sub_task_screens/sub_task_edit_sheet.dart';
import 'package:flutter_todo_application/presentation/screens/tag_screens/tag_edit_screen.dart';
import 'package:flutter_todo_application/presentation/screens/tag_screens/tag_list_screen.dart';
import 'package:flutter_todo_application/presentation/screens/tag_screens/tag_registration_sheet.dart';
import 'package:flutter_todo_application/presentation/screens/tag_screens/tag_select_sheet.dart';
import 'package:go_router/go_router.dart';
import 'package:tuple/tuple.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: RouterPath.home);
final listNavigatorKey = GlobalKey<NavigatorState>(debugLabel: RouterPath.list);
final settingsNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: RouterPath.settings,
);

final router = GoRouter(
  initialLocation: RouterPath.list,
  navigatorKey: rootNavigatorKey,
  routes: [
    // 複数の画面の状態を保持しつつ画面の切り替えを行う
    StatefulShellRoute.indexedStack(
      parentNavigatorKey: rootNavigatorKey,
      builder:
          (context, state, navigationShell) =>
              LayoutScaffold(navigationShell: navigationShell),
      branches: [
        // HomePageのルーティング設定
        StatefulShellBranch(
          navigatorKey: homeNavigatorKey,
          routes: [
            GoRoute(
              path: RouterPath.home,
              pageBuilder:
                  (context, state) =>
                      NoTransitionPage(key: state.pageKey, child: HomeScreen()),
            ),
          ],
        ),

        StatefulShellBranch(
          navigatorKey: listNavigatorKey,
          routes: [
            GoRoute(
              path: RouterPath.list,
              pageBuilder:
                  (context, state) =>
                      MaterialPage(key: state.pageKey, child: ListScreen()),
              routes: [
                GoRoute(
                  path: RouterPath.tagList,
                  parentNavigatorKey: rootNavigatorKey,
                  pageBuilder:
                      (context, state) => MaterialPage(
                        key: state.pageKey,
                        child: TagListScreen(),
                      ),
                  routes: [
                    GoRoute(
                      path: RouterPath.tagRegistration,
                      parentNavigatorKey: rootNavigatorKey,
                      pageBuilder: (context, state) {
                        return BottomSheetPage(
                          constraints: BoxConstraints(
                            maxHeight: MediaQuery.sizeOf(context).height * 0.7,
                          ),
                          builder: (builder) => TagRegistrationSheet(),
                        );
                      },
                      routes: [
                        GoRoute(
                          path: RouterPath.confirmBack,
                          parentNavigatorKey: rootNavigatorKey,
                          pageBuilder: (context, state) {
                            return DialogPage(
                              builder: (builder) => ConfirmBackDialog(),
                            );
                          },
                        ),
                      ],
                    ),
                    GoRoute(
                      path: RouterPath.tagEdit,
                      parentNavigatorKey: rootNavigatorKey,
                      pageBuilder: (context, state) {
                        final tag = state.extra as Tag;
                        return BottomSheetPage(
                          constraints: BoxConstraints(
                            maxHeight: MediaQuery.sizeOf(context).height * 0.7,
                          ),
                          builder: (builder) => TagEditSheet(tag),
                        );
                      },
                      routes: [
                        GoRoute(
                          path: RouterPath.tagDelete,
                          parentNavigatorKey: rootNavigatorKey,
                          pageBuilder: (context, state) {
                            final tagId = state.extra as String;
                            return DialogPage(
                              builder: (builder) => TagDeleteDialog(tagId),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                GoRoute(
                  path: RouterPath.edit,
                  parentNavigatorKey: listNavigatorKey,
                  pageBuilder: (context, state) {
                    final extra = state.extra as Tuple2<Task, List<Tag>>;
                    final task = extra.item1;
                    final tags = extra.item2;
                    return MaterialPage(
                      key: state.pageKey,
                      child: EditScreen(task, tags),
                    );
                  },
                  routes: [
                    GoRoute(
                      path: RouterPath.delete,
                      parentNavigatorKey: listNavigatorKey,
                      pageBuilder: (context, state) {
                        final taskId = state.extra as String;
                        return DialogPage(
                          builder: (builder) => DeleteDialog(taskId),
                        );
                      },
                    ),
                    GoRoute(
                      path: RouterPath.subTaskRegistration,
                      parentNavigatorKey: rootNavigatorKey,
                      pageBuilder: (context, state) {
                        final taskId = state.extra as String;
                        return BottomSheetPage(
                          builder:
                              (builder) => SubTaskRegistrationSheet(taskId),
                        );
                      },
                    ),
                    GoRoute(
                      path: RouterPath.subTaskEdit,
                      parentNavigatorKey: rootNavigatorKey,
                      pageBuilder: (context, state) {
                        final subTask = state.extra as SubTask;
                        return BottomSheetPage(
                          builder: (builder) => SubTaskEditSheet(subTask),
                        );
                      },
                    ),
                  ],
                ),
                GoRoute(
                  path: RouterPath.registration,
                  parentNavigatorKey: rootNavigatorKey,
                  pageBuilder: (context, state) {
                    final tags = state.extra as List<Tag>;
                    return BottomSheetPage(
                      builder: (builder) => RegistrationSheet(tags),
                    );
                  },
                  routes: [
                    GoRoute(
                      path: RouterPath.tagSelect,
                      parentNavigatorKey: rootNavigatorKey,
                      pageBuilder: (context, state) {
                        final extra = state.extra as Tuple2<List<Tag>, String?>;
                        final tags = extra.item1;
                        final selected = extra.item2;
                        return BottomSheetPage(
                          constraints: BoxConstraints(
                            maxHeight: MediaQuery.sizeOf(context).height * 0.8,
                          ),
                          builder:
                              (context) => Navigator(
                                onGenerateRoute:
                                    (context) => MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              TagSelectSheet(tags, selected),
                                    ),
                              ),
                        );
                      },
                    ),
                    GoRoute(
                      path: RouterPath.dateOrder,
                      parentNavigatorKey: rootNavigatorKey,
                      pageBuilder:
                          (context, state) => DialogPage(
                            builder: (builder) => DateOrderDialog(),
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),

        StatefulShellBranch(
          navigatorKey: settingsNavigatorKey,
          routes: [
            GoRoute(
              path: RouterPath.settings,
              pageBuilder:
                  (context, state) =>
                      MaterialPage(key: state.pageKey, child: SettingsScreen()),

              routes: [
                GoRoute(
                  path: RouterPath.theme,
                  pageBuilder: (context, state) {
                    final extra = state.extra as Tuple2<bool, int>;
                    final darkMode = extra.item1;
                    final primaryColor = extra.item2;
                    return MaterialPage(
                      key: state.pageKey,
                      child: SettingsThemeScreen(darkMode, primaryColor),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
