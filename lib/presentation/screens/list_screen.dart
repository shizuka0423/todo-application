import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_todo_application/application/state/tag_notifier.dart';
import 'package:flutter_todo_application/application/state/task_notifier.dart';
import 'package:flutter_todo_application/domain/types/edge.dart';
import 'package:flutter_todo_application/domain/types/tag.dart';
import 'package:flutter_todo_application/presentation/theme/icons.dart';
import 'package:flutter_todo_application/presentation/widgets/app_bars.dart';
import 'package:flutter_todo_application/presentation/widgets/custom_divider.dart';
import 'package:flutter_todo_application/presentation/widgets/no_task_image.dart';
import 'package:flutter_todo_application/presentation/widgets/list_widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ListScreen extends HookConsumerWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskNotifierProvider);
    final tags = ref.watch(tagNotifierProvider);
    final isLoading = useState<bool>(true);

    useEffect(() {
      final taskNotifier = ref.read(taskNotifierProvider.notifier);
      final tagNotifier = ref.read(tagNotifierProvider.notifier);

      Future.wait([
        taskNotifier.loadAllTask(),
        tagNotifier.loadAllTag(),
      ]).then((_) => isLoading.value = false);

      return null;
    }, const []);

    return Scaffold(
      //backgroundColor: Theme.of(context).colorScheme,
      appBar: listAppBar(),
      /*appBar: AppBar(
        centerTitle: true,
        title: Text("タスク一覧", style: AppText.appBarStyle),
        leading: Builder(
          builder:
              (context) => IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer(); // ← これでDrawerを開く
                },
              ),
        ),
        actions: [SortButton()],
      ),*/
      body:
          isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : tasks.isNotEmpty
              ? CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.fromLTRB(0, 24, 0, 24),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate((
                        BuildContext context,
                        int index,
                      ) {
                        final task = tasks[index];

                        // final Edge edge;

                        // //関数化
                        // if (tasks.length == 1) {
                        //   edge = Edge.only;
                        // } else if (index == 0) {
                        //   edge = Edge.start;
                        // } else if (index == tasks.length - 1) {
                        //   edge = Edge.end;
                        // } else {
                        //   edge = Edge.middle;
                        // }

                        return Column(
                          children: [
                            //if (index == 0) CustomDivider(),
                            TaskTile(task, tags),
                            CustomDivider(),
                          ],
                        );
                      }, childCount: tasks.length),
                    ),
                  ),
                ],
              )
              : NoTaskImage(),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Theme.of(context).colorScheme.surface,
        child: AppIcons.add,
        onPressed: () => _onPressed(context, tags),
        //onPressed: () => context.push('/list/registration', extra: tags),
      ),
    );
  }

  void _onPressed(BuildContext context, List<Tag> tags) {
    context.push('/list/registration', extra: tags);
    //_showLocalNotification('title', 'message');
  }

  void _showLocalNotification(String title, String message) {
    const androidNotificationDetail = AndroidNotificationDetails(
      'channel_id', // channel Id
      'channel_name', // channel Name
    );
    const iosNotificationDetail = DarwinNotificationDetails();
    const notificationDetails = NotificationDetails(
      iOS: iosNotificationDetail,
      android: androidNotificationDetail,
    );
    FlutterLocalNotificationsPlugin().show(
      0,
      title,
      message,
      notificationDetails,
    );
  }
}
