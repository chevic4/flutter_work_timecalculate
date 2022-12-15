
/*

import 'package:flutter_work_timecalculate/domain/services/workday_service.dart';
import 'package:flutter_work_timecalculate/presentation/widgets/select_date_widget.dart';
import 'package:flutter_work_timecalculate/presentation/widgets/select_time_widget.dart';
import 'package:mobx/mobx.dart';
part 'state_settig_screen.g.dart';

class StoreSettingDate = _StoreSettingDate with _$StoreSettingDate;

abstract class _StoreSettingDate with Store {
  final WorkDayService workDayService = WorkDayService();
  @observable
  DateTime beginDate = DateTime(2003, 03, 03, 03, 03);
  @observable
  DateTime finishDate = DateTime(2003, 03, 03, 03, 03);
  @observable
  bool workDayChange = true;

  initDate() {
    getDateBegin();
    getDateFinish();
  }

  @action
  void changeWorkDayValue() {
    workDayChange ? workDayChange = false : workDayChange = true;
  }

  Future<void> getDateBegin() async {
    await workDayService.initworkDayDefault();
    beginDate = workDayService.workDataProvider.workDay.beginWork;
  }

  Future<void> getDateFinish() async {
    await workDayService.initworkDayDefault();
    finishDate = workDayService.workDayDefault.finishWork;
  }

  Future<void> setDateBegin(context) async {
    beginDate = await selectDate(context, beginDate);
    workDayService.workDayDefault.beginWork = beginDate;
    workDayService.workDataProvider.saveWorkDayDefault();
  }

  Future<void> setTimeBegin(context) async {
    beginDate = await selectTime(context, beginDate);
    workDayService.workDayDefault.beginWork = beginDate;
    workDayService.workDataProvider.saveWorkDayDefault();
  }

  Future<void> setDateFinish(context) async {
    finishDate = await selectDate(context, finishDate);
    workDayService.workDayDefault.finishWork = finishDate;
    workDayService.workDataProvider.saveWorkDayDefault();
  }

  Future<void> setTimeFinish(context) async {
    finishDate = await selectTime(context, finishDate);
    workDayService.workDayDefault.finishWork = finishDate;
    workDayService.workDataProvider.saveWorkDayDefault();
  }
}

// flutter pub run build_runner build


*/