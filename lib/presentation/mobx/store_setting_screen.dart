import 'package:flutter/material.dart';
import 'package:flutter_work_timecalculate/domain/services/default_set_service.dart';
import 'package:flutter_work_timecalculate/presentation/mobx/round_tofive.dart';
import 'package:flutter_work_timecalculate/presentation/widgets/info_dialog_widget.dart';
import 'package:flutter_work_timecalculate/presentation/widgets/select_date_widget.dart';
import 'package:mobx/mobx.dart';
import '../widgets/select_time_widget.dart';
part 'store_setting_screen.g.dart';

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
    minutes = roundToFive(value);
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

    computeTimeFinish();
  }

  void computeDuration() {
    defDuration = _calculateDuration(beginTime, finishTime);
    minutes = defDuration.inMinutes.toInt() % 60;
    hours = defDuration.inHours.toDouble();

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
    beginTime = TimeOfDay(
        hour: beginTime.hour, minute: roundToFiveInt(beginTime.minute));

    if (workDayChange) {
      if (beginTime.hour > 16) {
        getInfoDialog(context, 'начало дневной смены не позднее 17-00');
        beginTime = TimeOfDay(hour: 16, minute: 00);
      }
      if (_validTimeOfDate(beginTime, finishTime) != true) {
        getInfoDialog(context, 'конец смены не может быть раньше её начала');
        finishTime = beginTime;
        defaultSettingsService.setTimeFinishDay(finishTime);
      }
      computeDuration();
      defaultSettingsService.setTimeBeginDay(beginTime);
    } else {
      if (beginTime.hour < 17) {
        getInfoDialog(context, 'начало ночной смены не раньше 17-00');
        beginTime = TimeOfDay(hour: 17, minute: 00);
      }
      computeDuration();
      defaultSettingsService.setTimeBeginNight(beginTime);
    }
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
    finishTime = TimeOfDay(
        hour: finishTime.hour, minute: roundToFiveInt(finishTime.minute));
    if (workDayChange) {
      final bool validTime = _validTimeOfDate(beginTime, finishTime);
      if (validTime != true) {
        getInfoDialog(
            context, 'время окончания не может быть раньше времени начала');
        finishTime = beginTime;
      }
      computeDuration();
      defaultSettingsService.setTimeFinishDay(finishTime);
    } else {
      computeDuration();
      defaultSettingsService.setTimeFinishNight(finishTime);
    }
  }

  void computeTimeFinish() {
    final result = _calculateTimeFinish(beginTime, defDuration);
    finishTime = result;
    workDayChange
        ? defaultSettingsService.setTimeFinishDay(result)
        : defaultSettingsService.setTimeFinishNight(result);
  }

  void goMainScreen(BuildContext context) {
    Navigator.popAndPushNamed(context, '/');
  }
}

bool _validTimeOfDate(TimeOfDay startTime, TimeOfDay endTime) {
  final int startTimeInt = (startTime.hour * 60 + startTime.minute);
  final int EndTimeInt = (endTime.hour * 60 + endTime.minute);
  return EndTimeInt > startTimeInt ? true : false;
}

Duration _calculateDuration(TimeOfDay beg, TimeOfDay end) {
  var bdate = beg.toDateTime();
  var edate = end.toDateTime();
  if (bdate.isBefore(edate) == false) {
    edate = edate.add(Duration(days: 1));
    return edate.difference(bdate);
  } else {
    return edate.difference(bdate);
  }
}

TimeOfDay _calculateTimeFinish(TimeOfDay timeDef, Duration durDef) {
  DateTime dateForCalculate = timeDef.toDateTime();

  dateForCalculate = dateForCalculate.add(durDef);

  return TimeOfDay(
      hour: dateForCalculate.hour, minute: dateForCalculate.minute);
}
