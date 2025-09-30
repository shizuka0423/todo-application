import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_application/application/state/registration_notifier.dart';
import 'package:flutter_todo_application/domain/types/tag.dart';
import 'package:flutter_todo_application/presentation/theme/radius_styles.dart';
import 'package:flutter_todo_application/presentation/theme/text_styles.dart';
import 'package:flutter_todo_application/presentation/widgets/custom_divider.dart';
import 'package:flutter_todo_application/presentation/widgets/list_tiles.dart';
import 'package:flutter_todo_application/presentation/widgets/text_fields.dart';
import 'package:flutter_todo_application/presentation/widgets/tiles/date_pick_tiles.dart';
import 'package:flutter_todo_application/presentation/widgets/tiles/notification_tiles.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegistrationSheet extends HookConsumerWidget {
  const RegistrationSheet(this._tags, {super.key});

  final List<Tag> _tags;

  /*static MaterialPageRoute routeS(List<Tag> tags) {
    return MaterialPageRoute(builder: (_) => TodoRegistrationScreen(tags));
  }*/

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useTextEditingController();
    final isTagId = useState<String?>(null);
    final isImportance = useState<int>(0);
    final isRegularly = useState<int>(0);
    //final isRepeatCount = useState<int>(0);
    final startAt = useState<DateTime?>(null);
    final endAt = useState<DateTime?>(null);
    //
    final remindMinute = useState<bool>(false);

    final isLoading = useState<bool>(false);
    final isValid = useState<bool>(false);

    final isDateListIndex = useState<int>(0);

    final blank = const SizedBox(height: 12);

    //FocusNode myFocusNode = FocusNode();

    useEffect(() {
      titleController.addListener(() {
        isValid.value = titleController.text.isNotEmpty && !isLoading.value;
      });
      return null;
    }, const []);

    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.8,
      child: Column(
        children: [
          AppBar(
            shape: RoundedRectangleBorder(borderRadius: AppRadius.appBar),
            centerTitle: true,
            //backgroundColor: Theme.of(context).colorScheme.primary,
            title: Text("新規登録", style: AppText.appBarM),
            leading: TextButton(
              onPressed: () => context.pop(),
              child: const Text('キャンセル'),
            ),
            leadingWidth: 100,
            actions: [
              TextButton(
                onPressed:
                    isValid.value
                        ? () async {
                          //まとめてif文
                          final datesAreSet =
                              startAt.value != null && endAt.value != null;
                          final isDate =
                              startAt.value == null && endAt.value == null;
                          final dateCheck =
                              datesAreSet
                                  ? startAt.value!.isAfter(endAt.value!)
                                  : false;

                          if (dateCheck) {
                            context.push('/list/registration/dateOrder');
                          } else {
                            isLoading.value = true;
                            //処理変更したため通知はon/offではなくズレを指定
                            final notification =
                                remindMinute.value == !isDate ? 1 : 0;
                            final notifier = ref.read(
                              registrationNotifierProvider.notifier,
                            );
                            await notifier.create(
                              titleController.text,
                              isTagId.value,
                              isImportance.value,
                              isRegularly.value,
                              0,
                              startAt.value,
                              endAt.value,
                              notification,
                            );
                            titleController.clear();
                            isLoading.value = false;
                          }
                        }
                        : null,
                child: Text("追加", style: AppText.bodyWS),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(6, 12, 6, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleTextField(titleController),
                    blank,
                    ImportanceTile(
                      isImportance.value,
                      (selected) => isImportance.value = selected,
                    ),
                    blank,
                    TagTile(
                      _tags,
                      isTagId.value,
                      (value) => isTagId.value = value,
                    ),
                    blank,

                    Column(
                      children: [
                        StartAtTile(
                          startAt.value,
                          (index) =>
                              isDateListIndex.value =
                                  index == isDateListIndex.value ? 0 : index,
                        ),
                        isDateListIndex.value == 1
                            ? RegistrationTableCalendar(
                              (date) => startAt.value = date,
                              false,
                              startAt.value,
                            )
                            : isDateListIndex.value == 3
                            ? TimePicker(
                              startAt.value,
                              false,
                              (date) => startAt.value = date,
                            )
                            : SizedBox.shrink(),
                        CustomDivider(),
                        EndAtTile(
                          isDateListIndex.value,
                          endAt.value,
                          (index) =>
                              isDateListIndex.value =
                                  index == isDateListIndex.value ? 0 : index,
                        ),
                        isDateListIndex.value == 2
                            ? RegistrationTableCalendar(
                              (date) => endAt.value = date,
                              true,
                              endAt.value,
                            )
                            : isDateListIndex.value == 4
                            ? TimePicker(
                              endAt.value,
                              true,
                              (date) => endAt.value = date,
                            )
                            : const SizedBox.shrink(),
                      ],
                    ),

                    blank,
                    startAt.value != null || endAt.value != null
                        ? Column(
                          children: [
                            NotificationTile(
                              remindMinute.value,
                              (value) => remindMinute.value = value,
                            ),
                            CustomDivider(),
                            RegularlyTile(
                              isRegularly.value,
                              (index) => isRegularly.value = index,
                            ),
                          ],
                        )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
