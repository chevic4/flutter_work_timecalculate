import 'package:flutter/material.dart';
import '../../core/theme/theme.dart';

Future<TimeOfDay> selectTime(
    BuildContext context, TimeOfDay defaultDate) async {
  final TimeOfDay? selected = await showTimePicker(
    context: context,
    initialTime: defaultDate,
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
  return selected != null && selected != defaultDate
      ? defaultDate = selected
      : defaultDate;
}
