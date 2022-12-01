import 'package:flutter/material.dart';
import '../../data/data_days.dart';
import '../../data/theme.dart';

Future<DateTime> selectTime(
    BuildContext context, DateTime defaultDate) async {
  final TimeOfDay? selected = await showTimePicker(
    context: context,
    initialTime: WorkDayMethods.getTimeFromDate(defaultDate),
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: colorMainG,
            onPrimary: Colors.black45,
            onSurface: Colors.blueGrey,
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: Colors.grey,
            ),
          ),
        ),
        child: child!,
      );
    },
  );
  return selected != null &&
          selected != WorkDayMethods.getTimeFromDate(defaultDate)
      ? defaultDate = WorkDayMethods.editTimeOnDate(defaultDate, selected)
      : defaultDate;
}
