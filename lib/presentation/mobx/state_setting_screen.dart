import 'package:flutter/material.dart';
import 'package:flutter_work_timecalculate/domain/services/default_set_service.dart';
import 'package:flutter_work_timecalculate/presentation/widgets/select_date_widget.dart';
import 'package:mobx/mobx.dart';

import '../widgets/select_time_widget.dart';
part 'state_setting_screen.g.dart';

class StoreSettingDate = _StoreSettingDate with _$StoreSettingDate;

abstract class _StoreSettingDate with Store {
  final DefaultSettingsService defaultSettingsService =
      DefaultSettingsService();

  Duration defDuration = Duration(minutes: 0);

  @observable
  bool workDayChange = true;

  @observable
  double hours = 0.0;

  @observable
  double minutes = 1.0;

  @observable
  DateTime beginDate = DateTime(2003, 03, 03, 03, 03);

  @observable
  TimeOfDay beginTime = TimeOfDay(hour: 09, minute: 09);

  @observable
  TimeOfDay finishTime = TimeOfDay(hour: 21, minute: 21);

  initDate() {
    getDurationDay();
    getDateBeginDay();
    getTimeBeginDay();
    getTimeFinishDay();
  }

  void changeWorkDayValue() async {
    workDayChange ? workDayChange = false : workDayChange = true;
    await workDayChange ? getDurationDay() : getDurationNight();
    await workDayChange ? getDateBeginDay() : getDateBeginNight();
    await workDayChange ? getTimeBeginDay() : getTimeBeginNight();
    await workDayChange ? getTimeFinishDay() : getTimeFinishNight();
  }

  // duration

  Future<void> getDurationNight() async {
    await defaultSettingsService.initDefaultSettings();

    defDuration = defaultSettingsService.defDurationNight;
    minutes = defDuration.inMinutes.toInt() % 60;
    hours = defDuration.inHours.toDouble();
  }

  Future<void> getDurationDay() async {
    await defaultSettingsService.initDefaultSettings();

    defDuration = defaultSettingsService.defDurationDay;
    minutes = defDuration.inMinutes.toInt() % 60;
    hours = defDuration.inHours.toDouble();
  }

  void setMinutes(double value) {
    minutes = value;
    setDuration();
  }

  void setHours(double value) {
    hours = value;
    setDuration();
  }

  void setDuration() {
    defDuration = Duration(hours: hours.toInt(), minutes: minutes.toInt());

    workDayChange
        ? defaultSettingsService.setDurationDay(defDuration)
        : defaultSettingsService.setDurationNight(defDuration);
  }

  // data Begin

  Future<void> getDateBeginDay() async {
    await defaultSettingsService.initDefaultSettings();

    beginDate = defaultSettingsService.defDateBeginDay;
  }

  Future<void> getDateBeginNight() async {
    await defaultSettingsService.initDefaultSettings();

    beginDate = defaultSettingsService.defDateBeginNight;
  }

  Future<void> setDateBegin(context) async {
    beginDate = await selectDate(context, beginDate);

    workDayChange
        ? defaultSettingsService.setDateBeginDay(beginDate)
        : defaultSettingsService.setDateBeginNight(beginDate);

    // if (workDayChange == false) {
    //   defaultSettingsService.defaultSettingsProvider.defaultDateBeginNight =
    //       beginDate;
    // }
  }

  // time begin

  Future<void> getTimeBeginDay() async {
    await defaultSettingsService.initDefaultSettings();
    beginTime = defaultSettingsService.getTimeBeginDay;
  }

  Future<void> getTimeBeginNight() async {
    await defaultSettingsService.initDefaultSettings();
    beginTime = defaultSettingsService.getTimeBeginNight;
  }

  Future<void> setTimeBegin(context) async {
    beginTime = await selectTime(context, beginTime);

    workDayChange
        ? defaultSettingsService.setTimeBeginDay(beginTime)
        : defaultSettingsService.setTimeBeginNight(beginTime);
  }

  // time finish

  Future<void> getTimeFinishDay() async {
    await defaultSettingsService.initDefaultSettings();
    finishTime = defaultSettingsService.getTimeFinishDay;
  }

  Future<void> getTimeFinishNight() async {
    await defaultSettingsService.initDefaultSettings();
    finishTime = defaultSettingsService.getTimeFinishNight;
  }

  Future<void> setTimeFinish(context) async {
    finishTime = await selectTime(context, finishTime);

    workDayChange
        ? defaultSettingsService.setTimeFinishDay(finishTime)
        : defaultSettingsService.setTimeFinishNight(finishTime);
  }
}

// flutter pub run build_runner build
