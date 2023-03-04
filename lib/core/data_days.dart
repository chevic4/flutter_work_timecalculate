import 'package:flutter/material.dart';

import '../domain/entity/workday.dart';

class DataWorking {
  DataWorking._();
  static TimeOfDay? beginTime;
  static TimeOfDay? finishTime;
  static List<WorkDay> data = [];
  static final instance = DataWorking._();
}

abstract class WorkDayMethods {
  // редактирование времени в дате
  static DateTime editTimeOnDate(DateTime dateValue, TimeOfDay timeValue) {
    dateValue = DateTime(dateValue.year, dateValue.month, dateValue.day,
        timeValue.hour, timeValue.minute);
    return dateValue;
  }

  // возврат времени из даты
  static TimeOfDay getTimeFromDate(DateTime value) {
    final result = TimeOfDay(hour: value.hour, minute: value.minute);
    return result;
  }
}
