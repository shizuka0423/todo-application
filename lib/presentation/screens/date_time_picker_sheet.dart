import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:board_datetime_picker/board_datetime_picker.dart';

class DateTimePickerSheet extends HookWidget {
  const DateTimePickerSheet(
  /*this._initialAt,
    this._onConfirmed,
    this._includeTime, */
  {super.key});

  // final DateTime _initialAt;
  // final ValueChanged<DateTime> _onConfirmed;
  // final bool _includeTime;

  @override
  Widget build(BuildContext context) {
    final selectedAt = useState<DateTime>(DateTime.now());

    return BoardDateTimePickerWidget(pickerType: DateTimePickerType.date);
  }
}
