import 'package:flutter/material.dart';
import 'package:flutter_work_timecalculate/data/data_days.dart';
import 'package:flutter_work_timecalculate/domain/entity/workday.dart';
import 'package:flutter_work_timecalculate/domain/services/default_set_service.dart';
import 'package:flutter_work_timecalculate/domain/services/workdays_service.dart';
import 'package:flutter_work_timecalculate/presentation/mobx/round_tofive.dart';
import 'package:mobx/mobx.dart';
import '../widgets/info_dialog_widget.dart';
import '../widgets/select_date_widget.dart';
import '../widgets/select_time_widget.dart';
part 'store_enterdata_screen.g.dart';

class StoreEnterData = _StoreEnterData with _$StoreEnterData;

abstract class _StoreEnterData with Store {
  final DefaultSettingsService defaultSettingsService =
      DefaultSettingsService();

  final WorkDayService workDayService = WorkDayService();

  Duration currentDuration = Duration(minutes: 0);

  @observable
  bool workDayChange = true;

  @observable
  DateTime currentBeginDate = DateTime(2003, 03, 03, 03, 03);

  @observable
  DateTime currentFinishDate = DateTime(2003, 03, 03, 03, 03);

  @observable
  double hours = 0.0;

  @observable
  double minutes = 1.0;

  initStore() {
    loadDataFromStoreDay();
  }

  void changeWorkDayValue() async {
    workDayChange ? workDayChange = false : workDayChange = true;
    await workDayChange ? loadDataFromStoreDay() : loadDataFromStoreNight();
  }

  Future<void> loadDataFromStoreDay() async {
    await defaultSettingsService.initDefaultSettings();

    currentBeginDate = defaultSettingsService.defDateBeginDay;
    currentBeginDate = WorkDayMethods.editTimeOnDate(
        currentBeginDate, defaultSettingsService.getTimeBeginDay);
    currentFinishDate = WorkDayMethods.editTimeOnDate(
        currentBeginDate, defaultSettingsService.getTimeFinishDay);

    _computeDuration();
  }

  Future<void> loadDataFromStoreNight() async {
    await defaultSettingsService.initDefaultSettings();

    currentBeginDate = defaultSettingsService.defDateBeginNight;
    currentBeginDate = WorkDayMethods.editTimeOnDate(
        currentBeginDate, defaultSettingsService.getTimeBeginNight);
    currentFinishDate = WorkDayMethods.editTimeOnDate(
        currentBeginDate.add(Duration(days: 1)),
        defaultSettingsService.getTimeFinishNight);

    _computeDuration();
  }

  // duration

  void setMinutes(double value) {
    minutes = roundToFive(value);
    setDuration();
  }

  void setHours(double value) {
    hours = value;
    setDuration();
  }

  void setDuration() {
    currentDuration = Duration(hours: hours.toInt(), minutes: minutes.toInt());
    currentFinishDate = currentBeginDate.add(currentDuration);
  }

  void _computeDuration() {
    currentDuration = currentFinishDate.difference(currentBeginDate);
    minutes = currentDuration.inMinutes.toInt() % 60;
    hours = currentDuration.inHours.toDouble();
  }

  // data Begin

  Future<void> setDateBegin(context) async {
    TimeOfDay cacheTimeStart = WorkDayMethods.getTimeFromDate(currentBeginDate);
    TimeOfDay cacheTimeFinish =
        WorkDayMethods.getTimeFromDate(currentFinishDate);
    currentBeginDate = await selectDate(context, currentBeginDate);
    currentBeginDate =
        WorkDayMethods.editTimeOnDate(currentBeginDate, cacheTimeStart);

    workDayChange
        ? currentFinishDate =
            WorkDayMethods.editTimeOnDate(currentBeginDate, cacheTimeFinish)
        : currentFinishDate = WorkDayMethods.editTimeOnDate(
            currentBeginDate.add(Duration(days: 1)), cacheTimeFinish);
  }

  // time begin

  Future<void> setTimeBegin(context) async {
    TimeOfDay cache = await selectTime(
        context, WorkDayMethods.getTimeFromDate(currentBeginDate));
    cache = TimeOfDay(hour: cache.hour, minute: roundToFiveInt(cache.minute));
    currentBeginDate = WorkDayMethods.editTimeOnDate(currentBeginDate, cache);

    if (workDayChange) {
      if (currentBeginDate.hour > 16) {
        getInfoDialog(context, 'начало дневной смены не позднее 17-00');
        currentBeginDate = WorkDayMethods.editTimeOnDate(
            currentBeginDate, TimeOfDay(hour: 16, minute: 00));
      }
      if (_validTimeOfDate(WorkDayMethods.getTimeFromDate(currentBeginDate),
              WorkDayMethods.getTimeFromDate(currentFinishDate)) !=
          true) {
        getInfoDialog(
            context, 'начало смены не может быть позднее её окончания');
        currentFinishDate = WorkDayMethods.editTimeOnDate(currentFinishDate,
            WorkDayMethods.getTimeFromDate(currentBeginDate));
      }
      _computeDuration();
    } else {
      if (currentBeginDate.hour < 17) {
        getInfoDialog(context, 'ночная смена не может быть раньше 17-00');
        currentBeginDate = WorkDayMethods.editTimeOnDate(
            currentBeginDate, TimeOfDay(hour: 17, minute: 00));
      }
      _computeDuration();
    }
  }

  // time finish

  Future<void> setTimeFinish(context) async {
    TimeOfDay cache = await selectTime(
        context, WorkDayMethods.getTimeFromDate(currentFinishDate));
    cache = TimeOfDay(hour: cache.hour, minute: roundToFiveInt(cache.minute));
    currentFinishDate = WorkDayMethods.editTimeOnDate(currentBeginDate, cache);

    if (workDayChange) {
      if (currentBeginDate.isBefore(currentFinishDate) != true) {
        getInfoDialog(context,
            'время окончания не может быть раньше времени начала смены');
        currentFinishDate = WorkDayMethods.editTimeOnDate(
            currentBeginDate, WorkDayMethods.getTimeFromDate(currentBeginDate));
      }
    } else {
      if (currentBeginDate.isBefore(currentFinishDate) != true) {
        currentFinishDate = currentFinishDate.add(Duration(days: 1));
      }
    }
    _computeDuration();
  }

  Future<void> loadWorkDays() async {
    List<WorkDay> result = await workDayService.loadListWorkDay();
    print(result);
  }

  void goMainScreenNotSave(BuildContext context) {
    Navigator.popAndPushNamed(context, '/');
  }

  Future<void> goMainScreenSave(BuildContext context) async {
    WorkDay _data =
        WorkDay(beginWork: currentBeginDate, finishWork: currentFinishDate);

    await workDayService.addToStore(_data);
    Navigator.popAndPushNamed(context, '/');
  }
}

bool _validTimeOfDate(TimeOfDay startTime, TimeOfDay endTime) {
  final int startTimeInt = (startTime.hour * 60 + startTime.minute);
  final int EndTimeInt = (endTime.hour * 60 + endTime.minute);
  return EndTimeInt > startTimeInt ? true : false;
}
