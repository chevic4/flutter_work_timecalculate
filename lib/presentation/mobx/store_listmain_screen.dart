import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_work_timecalculate/domain/services/workdays_service.dart';
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
    loading = true;
    listWorkDays.addAll(await workDayService.loadListWorkDay());
    loading = false;
  }

  Future<void> deleteIndex(int index) async {
    loading = true;
    workDayService.deleteWorkdayIndex(index);
    await loadDataFromStore();
    loading = false;
  }

  void goSettingScreen(BuildContext context) {
    Navigator.popAndPushNamed(context, '/settings');
  }

  void goAddScreen(BuildContext context) {
    Navigator.popAndPushNamed(context, '/enterdata');
  }

  void goEditScreen(BuildContext context, int value) {
    Navigator.popAndPushNamed(context, '/editdata', arguments: value);
  }

  void clearList(BuildContext context) {}

  void onDismissed(BuildContext context, SlidebleAction action, int index) {
    switch (action) {
      case SlidebleAction.delete:
        deleteIndex(index);
        break;

      case SlidebleAction.edit:
        break;
    }
  }
}

enum SlidebleAction { delete, edit }
