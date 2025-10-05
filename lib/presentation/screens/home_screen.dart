import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_application/application/state/tag_notifier.dart';
import 'package:flutter_todo_application/application/state/task_notifier.dart';
import 'package:flutter_todo_application/domain/features/datetime_ext.dart';
import 'package:flutter_todo_application/presentation/theme/colors.dart';
import 'package:flutter_todo_application/presentation/theme/text_styles.dart';
import 'package:flutter_todo_application/presentation/widgets/list_widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

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

    final initialPage = 10000;
    final pageController = usePageController(initialPage: initialPage);

    final currentDate = useState(DateTime.now());

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            title: GestureDetector(
              onTap: () => context.push('/home/datePicker'),
              child: Text(
                currentDate.value.format(format: "yyyy年MM月dd日"),
                style: AppText.appBarStyle,
              ),
            ),
            floating: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                color: BrandColor.white,
                height: 500,
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (index) {
                    currentDate.value = DateTime.now().add(
                      Duration(days: index - initialPage),
                    );
                  },
                  itemBuilder: (context, index) {
                    final date = DateTime.now().add(
                      Duration(days: index - initialPage),
                    );
                    return Center();
                  },
                ),
              ),
            ]),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate((
              BuildContext context,
              int index,
            ) {
              final task = tasks[index];
              return task.startAt == null && task.endAt == null
                  ? TaskTile(task, tags)
                  : const SizedBox.shrink();
            }, childCount: tasks.length),
          ),
        ],
      ),
    );
  }
}
