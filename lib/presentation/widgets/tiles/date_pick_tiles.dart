import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_application/domain/features/datetime_ext.dart';
import 'package:flutter_todo_application/presentation/theme/icons.dart';
import 'package:flutter_todo_application/presentation/theme/radius_styles.dart';
import 'package:flutter_todo_application/presentation/theme/sizes.dart';
import 'package:flutter_todo_application/presentation/theme/text_styles.dart';
import 'package:table_calendar/table_calendar.dart';

class StartAtTile extends StatelessWidget {
  const StartAtTile(this._startAt, this._onTap, {super.key});

  final DateTime? _startAt;
  final ValueChanged<int> _onTap;

  @override
  Widget build(BuildContext context) {
    final hasStartAt = _startAt != null;
    return ListTile(
      onTap: () => _onTap(1),
      tileColor: Theme.of(context).colorScheme.surface,
      shape: AppShapes.top,
      minTileHeight: AppSize.tile2,
      leading: AppIcons.eventStart,
      title: Text('開始日'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            child: Text(
              hasStartAt ? _startAt.format(format: 'y/MM/dd') : '設定なし',
              style: AppText.trailing,
            ),
            onTap: () => _onTap(1),
          ),
          hasStartAt
              ? Padding(
                padding: EdgeInsets.only(left: 8),
                child: GestureDetector(
                  child: Text(
                    _startAt.format(format: 'H:mm'),
                    style: AppText.trailing,
                  ),
                  onTap: () => _onTap(3),
                ),
              )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}

class EndAtTile extends StatelessWidget {
  const EndAtTile(this._selectedTiles, this._endAt, this._onTap, {super.key});
  final int _selectedTiles;
  final DateTime? _endAt;
  final ValueChanged<int> _onTap;

  @override
  Widget build(BuildContext context) {
    final isBottomTile = _selectedTiles != 2 && _selectedTiles != 4;
    final hasEndAt = _endAt != null;
    return ListTile(
      tileColor: Theme.of(context).colorScheme.surface,
      shape: isBottomTile ? AppShapes.bottom : null,
      onTap: () => _onTap(2),
      minTileHeight: AppSize.tile2,
      leading: AppIcons.eventEnd,
      title: Text('終了日'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            child: Text(
              hasEndAt ? _endAt.format(format: 'y/MM/dd') : '設定なし',
              style: AppText.trailing,
            ),
            onTap: () => _onTap(2),
          ),
          hasEndAt
              ? Padding(
                padding: EdgeInsets.only(left: 8),
                child: GestureDetector(
                  child: Text(
                    _endAt.format(format: 'H:mm'),
                    style: AppText.trailing,
                  ),
                  onTap: () => _onTap(4),
                ),
              )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}

class RegistrationTableCalendar extends HookWidget {
  const RegistrationTableCalendar(
    this._onAtSelected,
    this._isEnd,
    this._initialAt, {
    super.key,
  });
  final ValueChanged<DateTime?> _onAtSelected;
  final bool _isEnd;
  final DateTime? _initialAt;

  @override
  Widget build(BuildContext context) {
    final focusedDay = useState<DateTime>(_initialAt ?? DateTime.now());
    final selectedDay = useState<DateTime?>(_initialAt);
    return SizedBox(
      height: 350,
      child: Stack(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: _isEnd ? AppRadius.bottom : null,
            ),
            child: TableCalendar(
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: TextStyle(fontSize: 12),
                weekendStyle: TextStyle(fontSize: 12),
              ),
              daysOfWeekHeight: 24.0,
              calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).colorScheme.primary.withValues(alpha: 0.5),
                  shape: BoxShape.circle,
                ),
                todayTextStyle: TextStyle(color: null),
              ),
              headerStyle: HeaderStyle(
                headerPadding: EdgeInsets.zero,
                formatButtonVisible: false,
                titleTextStyle: TextStyle(fontSize: 15),
                rightChevronPadding: EdgeInsets.only(right: 48.0),
              ),
              shouldFillViewport: true,
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2049, 12, 31),
              focusedDay: focusedDay.value,
              selectedDayPredicate: (day) => isSameDay(selectedDay.value, day),
              onDaySelected: (selected, focused) {
                final selectedAt = selectedDay.value;
                final adjustedAt =
                    selectedAt != null
                        ? selected.copyWith(
                          hour: selectedAt.hour,
                          minute: selectedAt.minute,
                        )
                        : _isEnd
                        ? selected.copyWith(hour: 23, minute: 59)
                        : selected;

                selectedDay.value = adjustedAt;
                focusedDay.value = focused;
                _onAtSelected(adjustedAt);
              },
              locale: 'ja_JP',
            ),
          ),
          Positioned(
            top: 0,
            right: 4,
            child: IconButton(
              icon: Icon(Icons.delete_outline),
              tooltip: '日付をクリア',
              onPressed: () {
                focusedDay.value = DateTime.now();
                selectedDay.value = null;
                _onAtSelected(null);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TimePicker extends StatelessWidget {
  const TimePicker(
    this._initialAt,
    this._isEnd,
    this._onAtChanged, {
    super.key,
  });

  final DateTime? _initialAt;
  final bool _isEnd;
  final ValueChanged<DateTime> _onAtChanged;

  @override
  Widget build(BuildContext context) {
    final initialAt = _initialAt ?? DateTime.now(); // fallbackに now() を使っても良い
    final hourController = FixedExtentScrollController(
      initialItem: 4800 + initialAt.hour,
    );
    final minuteController = FixedExtentScrollController(
      initialItem: 5040 + initialAt.minute,
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: _isEnd ? AppRadius.bottom : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 250,
            width: MediaQuery.sizeOf(context).width * 0.4,
            child: NotificationListener<ScrollEndNotification>(
              onNotification: (notification) {
                final index = hourController.selectedItem;
                final adjustedHour = initialAt.copyWith(hour: index % 24);
                _onAtChanged(adjustedHour);
                return false;
              },
              child: ListWheelScrollView.useDelegate(
                controller: hourController,
                offAxisFraction: -0.33,
                diameterRatio: 1.4,
                perspective: 0.01,
                useMagnifier: true,
                magnification: 1.1,
                itemExtent: 30,
                physics: FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                  builder:
                      (context, index) => Padding(
                        padding: EdgeInsets.only(right: 22),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text('${index % 24}', style: AppText.widgetM),
                        ),
                      ),
                  childCount: 9600,
                ),
              ),
            ),
          ),
          Text(':', style: AppText.widgetM),
          SizedBox(
            height: 250,
            width: MediaQuery.sizeOf(context).width * 0.4,
            child: NotificationListener<ScrollEndNotification>(
              onNotification: (notification) {
                final index = minuteController.selectedItem;
                final adjustedMinute = initialAt.copyWith(minute: index % 60);
                _onAtChanged(adjustedMinute);
                return false;
              },
              child: ListWheelScrollView.useDelegate(
                controller: minuteController,
                offAxisFraction: 0.33,
                diameterRatio: 1.4,
                perspective: 0.01,
                useMagnifier: true,
                magnification: 1.1,
                itemExtent: 30,
                physics: FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                  builder:
                      (context, index) => Padding(
                        padding: EdgeInsets.only(left: 22),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            (index % 60).toString().padLeft(2, '0'),
                            style: AppText.widgetM,
                          ),
                        ),
                      ),
                  childCount: 10080,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
