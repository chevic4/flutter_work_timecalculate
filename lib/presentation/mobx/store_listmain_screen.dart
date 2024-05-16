import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_work_timecalculate/core/services/navigation_service.dart';
import 'package:flutter_work_timecalculate/domain/services/workdays_service.dart';
import 'package:flutter_work_timecalculate/presentation/screens/calc_html_screen.dart';
import 'package:flutter_work_timecalculate/presentation/screens/editdata_screen.dart';
import 'package:flutter_work_timecalculate/presentation/screens/enterdata_screen.dart';
import 'package:flutter_work_timecalculate/presentation/screens/settings_screen.dart';
import 'package:mobx/mobx.dart';
import '../../domain/entity/workday.dart';
part 'store_listmain_screen.g.dart';

class StoreListMain = _StoreListMain with _$StoreListMain;

abstract class _StoreListMain with Store {
  final WorkDayService workDayService = WorkDayService();

  @observable
  bool loading = true;

  @observable
  ObservableList<WorkDay> listWorkDays = ObservableList<WorkDay>();

  initStore() {
    loadDataFromStore();
  }

  Future<void> loadDataFromStore() async {
    listWorkDays.clear();
    loading = true;
    listWorkDays.addAll(await workDayService.loadListWorkDay());
    loading = false;
  }

  Future<void> deleteIndex(int index) async {
    loading = true;
    await workDayService.deleteWorkdayIndex(index);
    await loadDataFromStore();
    loading = false;
  }

  void goSettingScreen(BuildContext context) {
    NavigationService.navigatePush(const SettingScreen());
  }

  void goAddScreen(BuildContext context) {
    NavigationService.navigatePush(const EnterDataScreen());
  }

  void goEditScreen(BuildContext context, int value) {
    NavigationService.navigatePush(EditDataScreen(indexWorkDay: value));
  }

  void goCalcScreen(BuildContext context) {
    NavigationService.navigatePush(const CalcHtmlScreen());
  }

  int getLengthWorkDays() {
    return listWorkDays.length;
  }

  Duration durationWorkDays() {
    Duration result = Duration();
    for (var element in listWorkDays) {
      var cache = element.finishWork.difference(element.beginWork);
      result += cache;
    }
    return result;
  }

  Future<void> clearList() async {
    loading = true;
    await workDayService.deleteBox();
    listWorkDays.clear();
    loading = false;
  }

  Future<bool> isLoadingStatus() async {
    return loading ? true : false;
  }
}
