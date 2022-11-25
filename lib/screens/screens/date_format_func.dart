import 'package:flutter/material.dart';

String format(Duration d) {
  return '${d.inHours.toString().padLeft(2, '0')} час ${d.inMinutes.remainder(60).toString().padLeft(2, '0')} мин';
}

extension TimeOfDayConverter on TimeOfDay {
  String to24hours() {
    final hour = this.hour.toString().padLeft(2, "0");
    final min = minute.toString().padLeft(2, "0");
    return "$hour:$min";
  }
}
