import 'package:flutter/material.dart';
import 'package:flutter_work_timecalculate/domain/services/enums.dart';
import 'deffault_set_service_provider.dart';

class DefaultSettingsService {
  final defaultSettingsProvider = DefaultSettingsProvider();

  Duration get defDurationDay => defaultSettingsProvider.defaultDurationDay;
  Duration get defDurationNight => defaultSettingsProvider.defaultDurationNight;

  DateTime get defDateBeginDay => defaultSettingsProvider.defaultDateBeginDay;
  DateTime get defDateBeginNight =>
      defaultSettingsProvider.defaultDateBeginNight;

  TimeOfDay get getTimeBeginDay =>
      TimeOfDay.fromDateTime(defaultSettingsProvider.defaultBeginTimeDay);
  TimeOfDay get getTimeBeginNight =>
      TimeOfDay.fromDateTime(defaultSettingsProvider.defaultBeginTimeNight);

  TimeOfDay get getTimeFinishDay =>
      TimeOfDay.fromDateTime(defaultSettingsProvider.defaultFinishTimeDay);
  TimeOfDay get getTimeFinishNight =>
      TimeOfDay.fromDateTime(defaultSettingsProvider.defaultFinishTimeNight);

  Future<void> initDefaultSettings() async {
    await defaultSettingsProvider.loadDuration(true);
    await defaultSettingsProvider.loadDuration(false);

    await defaultSettingsProvider.loadDateBegin(DefaultTime.dateBeginDay);
    await defaultSettingsProvider.loadDateBegin(DefaultTime.dateBeginNight);

    await defaultSettingsProvider.loadDateBegin(DefaultTime.timeBeginDay);
    await defaultSettingsProvider.loadDateBegin(DefaultTime.timeBeginNight);

    await defaultSettingsProvider.loadDateBegin(DefaultTime.timeFinishDay);
    await defaultSettingsProvider.loadDateBegin(DefaultTime.timeFinishNight);
  }

// duration

  setDurationDay(Duration value) {
    defaultSettingsProvider.defaultDurationDay = value;
    defaultSettingsProvider.saveDuration(true);
  }

  setDurationNight(Duration value) {
    defaultSettingsProvider.defaultDurationNight = value;
    defaultSettingsProvider.saveDuration(false);
  }

// begin day

  setDateBeginDay(DateTime value) {
    defaultSettingsProvider.defaultDateBeginDay = value;
    defaultSettingsProvider.saveDateBegin(DefaultTime.dateBeginDay);
  }

  setDateBeginNight(DateTime value) {
    defaultSettingsProvider.defaultDateBeginNight = value;
    defaultSettingsProvider.saveDateBegin(DefaultTime.dateBeginNight);
  }

// begin time

  setTimeBeginDay(TimeOfDay value) {
    final DateTime toStore = value.toDateTime();
    defaultSettingsProvider.defaultBeginTimeDay = toStore;
    defaultSettingsProvider.saveDateBegin(DefaultTime.timeBeginDay);
  }

  setTimeBeginNight(TimeOfDay value) {
    final DateTime toStore = value.toDateTime();
    defaultSettingsProvider.defaultBeginTimeNight = toStore;
    defaultSettingsProvider.saveDateBegin(DefaultTime.timeBeginNight);
  }

// finish time

  setTimeFinishDay(TimeOfDay value) {
    final DateTime toStore = value.toDateTime();
    defaultSettingsProvider.defaultFinishTimeDay = toStore;
    defaultSettingsProvider.saveDateBegin(DefaultTime.timeFinishDay);
  }

  setTimeFinishNight(TimeOfDay value) {
    final DateTime toStore = value.toDateTime();
    defaultSettingsProvider.defaultFinishTimeNight = toStore;
    defaultSettingsProvider.saveDateBegin(DefaultTime.timeFinishNight);
  }
}

extension TOD on TimeOfDay {
  DateTime toDateTime() {
    return DateTime(2021, 1, 1, hour, minute);
  }
}
