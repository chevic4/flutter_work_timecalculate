import 'package:flutter/material.dart';
import 'package:flutter_work_timecalculate/domain/entity/workday.dart';
import 'package:flutter_work_timecalculate/domain/services/workdays_service.dart';
import 'package:flutter_work_timecalculate/presentation/mobx/round_tofive.dart';
import 'package:mobx/mobx.dart';

import '../../data/data_days.dart';
import '../screens/listmain_screen.dart';
import '../widgets/info_dialog_widget.dart';
import '../widgets/select_time_widget.dart';

part 'store_editdata_screen.g.dart';

class StoreEditData = _StoreEditData with _$StoreEditData;

abstract class _StoreEditData with Store {
  final WorkDayService workDayService = WorkDayService();

  Duration currentDuration = Duration(minutes: 0);

  @observable
  double hours = 0.0;

  @observable
  double minutes = 1.0;

  @observable
  int indexstore = 0;

  @observable
  bool workDayChange = true;

  @observable
  bool isLoaded = false;

  @observable
  DateTime currentBeginDate = DateTime(2003, 03, 03, 03, 03);

  @observable
  DateTime currentFinishDate = DateTime(2003, 03, 03, 03, 03);

  // store

  Future<void> loadDataFromStore() async {
    isLoaded = false;
    final workDayFromStore = await workDayService.loadWorkdayIndex(indexstore);
    workDayFromStore.beginWork.hour < 17
        ? workDayChange = true
        : workDayChange = false;
    currentBeginDate = workDayFromStore.beginWork;
    currentFinishDate = workDayFromStore.finishWork;
    _computeDuration();
    isLoaded = true;
  }

  Future<void> saveToStore() async {
    await workDayService.editWorkdayIndex(
        index: indexstore,
        value: WorkDay(
            beginWork: currentBeginDate, finishWork: currentFinishDate));
  }

  Future<void> deleteFromStore() async {
    await workDayService.deleteWorkdayIndex(indexstore);
  }

  void changeWorkDayValue() {
    workDayChange ? workDayChange = false : workDayChange = true;
  }

  void initstore(int value) {
    indexstore = value;
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

  // time begin

  Future<void> setTimeBegin(context) async {
    TimeOfDay cacheTime = await selectTime(
        context, WorkDayMethods.getTimeFromDate(currentBeginDate));
    cacheTime = TimeOfDay(
        hour: cacheTime.hour, minute: roundToFiveInt(cacheTime.minute));
    final DateTime cacheDataTime =
        WorkDayMethods.editTimeOnDate(currentBeginDate, cacheTime);

    if (workDayChange) {
      if (cacheDataTime.hour > 16) {
        getInfoDialog(context, 'начало дневной смены не может позднее 17-00');
      } else {
        if (_validTimeOfDate(WorkDayMethods.getTimeFromDate(cacheDataTime),
                WorkDayMethods.getTimeFromDate(currentFinishDate)) !=
            true) {
          getInfoDialog(
              context, 'начало смены не может быть позднее её окончания');
        } else {
          currentBeginDate = cacheDataTime;
          _computeDuration();
        }
      }
    } else {
      if (cacheDataTime.hour < 17) {
        getInfoDialog(context, 'ночная смена не может быть раньше 17-00');
      } else {
        if (cacheDataTime.isBefore(currentFinishDate)) {
          cacheDataTime.add(Duration(days: 1));
        }
      }
      currentBeginDate = cacheDataTime;
      _computeDuration();
    }
  }

  // time finish

  Future<void> setTimeFinish(context) async {
    TimeOfDay cacheTime = await selectTime(
        context, WorkDayMethods.getTimeFromDate(currentFinishDate));
    cacheTime = TimeOfDay(
        hour: cacheTime.hour, minute: roundToFiveInt(cacheTime.minute));
    DateTime cacheDate =
        WorkDayMethods.editTimeOnDate(currentFinishDate, cacheTime);

    if (workDayChange) {
      if (currentBeginDate.isBefore(cacheDate) != true) {
        getInfoDialog(context,
            'время окончания не может быть раньше времени начала смены');
      } else {
        currentFinishDate = cacheDate;
        _computeDuration();
      }
    } else {
      if (currentBeginDate.isBefore(cacheDate) != true) {
        cacheDate = cacheDate.add(Duration(days: 1));
      }
      currentFinishDate = cacheDate;
      _computeDuration();
    }
  }

  Future<void> goMainScreenSaveData(BuildContext context) async {
    isLoaded = true;
    await saveToStore();
    isLoaded = false;
    Navigation(context);
  }

  void goMainScreenNotSave(BuildContext context) {
    Navigation(context);
  }

  Future<void> goMainScreenDeleteDay(BuildContext context) async {
    isLoaded = true;
    await deleteFromStore();
    isLoaded = false;
    Navigation(context);
  }

  void Navigation(BuildContext context) {
    Navigator.popAndPushNamed(context, '/');
  }
}

extension DateTimeparsingTime on DateTime {
  String getTime() {
    final hour = this.hour.toString().padLeft(2, "0");
    final min = minute.toString().padLeft(2, "0");
    return "$hour:$min";
  }
}

bool _validTimeOfDate(TimeOfDay startTime, TimeOfDay endTime) {
  final int startTimeInt = (startTime.hour * 60 + startTime.minute);
  final int EndTimeInt = (endTime.hour * 60 + endTime.minute);
  return EndTimeInt > startTimeInt ? true : false;
}
