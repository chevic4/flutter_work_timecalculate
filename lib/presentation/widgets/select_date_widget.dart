import 'package:flutter/material.dart';
import '../../core/theme/theme.dart';

Future<DateTime> selectDate(
    BuildContext context, DateTime workDaybeginDate) async {
  final DateTime? selected = await showDatePicker(
    context: context,
    initialDate: workDaybeginDate,
    firstDate: DateTime(2021),
    lastDate: DateTime(2024),
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: colorMainG,
            onPrimary: Colors.black45,
            onSurface: colorText,
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: colorText,
            ),
          ),
        ),
        child: child!,
      );
    },
  );
  return selected != null && selected != workDaybeginDate
      ? selected
      : workDaybeginDate;
}
