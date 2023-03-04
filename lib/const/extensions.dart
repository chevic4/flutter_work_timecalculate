import 'package:flutter/material.dart';

extension TimeOfDayConverter on TimeOfDay {
  String to24hours() {
    final hour = this.hour.toString().padLeft(2, "0");
    final min = minute.toString().padLeft(2, "0");
    return "$hour:$min";
  }
}

extension DateTimeparsingTime on DateTime {
  String getTime() {
    final hour = this.hour.toString().padLeft(2, "0");
    final min = minute.toString().padLeft(2, "0");
    return "$hour:$min";
  }
}

extension DurationConverter on Duration {
  String to24hours() {
    int minutes = this.inMinutes.toInt() % 60;
    int hours = this.inHours.toInt();
    final hour = hours.toString().padLeft(2, "0");
    final min = minutes.toString().padLeft(2, "0");
    return "$hour:$min";
  }
}