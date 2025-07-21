import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_application/presentation/theme/radius_styles.dart';
import 'package:table_calendar/table_calendar.dart';

class TableCalendarScreen extends StatelessWidget {
  const TableCalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      daysOfWeekHeight: 24.0,
      firstDay: DateTime.utc(2010, 1, 1),
      lastDay: DateTime.utc(2030, 1, 1),
      focusedDay: DateTime.now(),
      locale: 'ja_JP',
    );
  }
}
