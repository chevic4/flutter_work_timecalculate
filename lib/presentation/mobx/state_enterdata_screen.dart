import 'package:flutter_work_timecalculate/data/data_days.dart';
import 'package:flutter_work_timecalculate/domain/services/default_set_service.dart';
import 'package:mobx/mobx.dart';
part 'state_enterdata_screen.g.dart';

class StoreEnterData = _StoreEnterData with _$StoreEnterData;

abstract class _StoreEnterData with Store {
  final DefaultSettingsService defaultSettingsService =
      DefaultSettingsService();

  Duration defDuration = Duration(minutes: 0);

  @observable
  bool workDayChange = true;

  @observable
  DateTime currentBeginDate = DateTime(2003, 03, 03, 03, 03);

  @observable
  DateTime currentFinishDate = DateTime(2003, 03, 03, 03, 03);

  initDate() {
    loadDataFromStoreDay();
  }

  void changeWorkDayValue() async {
    workDayChange ? workDayChange = false : workDayChange = true;
    // await workDayChange ? getDurationDay() : getDurationNight();

    // duration
  }

  Future<void> loadDataFromStoreDay() async {
    await defaultSettingsService.initDefaultSettings();
    if (workDayChange) {
      currentBeginDate = defaultSettingsService.defDateBeginDay;
      currentBeginDate = WorkDayMethods.editTimeOnDate(
          currentBeginDate, defaultSettingsService.getTimeBeginDay);
      currentFinishDate = WorkDayMethods.editTimeOnDate(
          currentBeginDate, defaultSettingsService.getTimeFinishDay);
    }
    // beginDate = defaultSettingsService.defDateBeginDay;
  }
}
