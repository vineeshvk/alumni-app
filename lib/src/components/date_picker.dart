import 'package:alumni_app/src/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDatePicker extends StatelessWidget {
  final void Function(DateTime newDate) onDateTimeChanged;
  final DateTime initialDateTime;
  final int maxYear;

  const CustomDatePicker({
    Key key,
    this.onDateTimeChanged,
    this.initialDateTime,
    this.maxYear,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentYear = DateTime.now().year;
    return CupertinoTheme(
      data: CupertinoThemeData(brightness: Brightness.dark),
      child: Container(
        child: CupertinoDatePicker(
          backgroundColor: PRIMARY_DARK,
          initialDateTime: initialDateTime ?? DateTime(2000, 1, 1),
          onDateTimeChanged: onDateTimeChanged,
          maximumDate: DateTime.now(),
          minimumYear: 1950,
          maximumYear: maxYear ?? currentYear,
          minuteInterval: 1,
          mode: CupertinoDatePickerMode.date,
        ),
      ),
    );
  }
}
