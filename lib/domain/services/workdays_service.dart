import 'package:flutter_work_timecalculate/domain/entity/workday.dart';
import 'package:flutter_work_timecalculate/domain/services/workdays_service_provider.dart';

class WorkDayService {
  final workDaysStoreProvider = WorkDaysStoreProvider();

  Future<List<WorkDay>> loadListWorkDay() async {
    final result = await workDaysStoreProvider.getWorkDaysFromHive();
    if (result == null) {
      return [];
    } else
      return result;
  }

  Future<WorkDay> loadWorkdayIndex(int index) async {
    final result = await workDaysStoreProvider.getWorkdayIndexFromHive(index);
    return result;
  }

  Future<void> addToStore(WorkDay value) async {
    await workDaysStoreProvider.addWorkdayToHive(value);
  }

  Future<void> deleteWorkdayIndex(int index) async {
    await workDaysStoreProvider.deleteWorkdayIndexFromHive(index);
  }

  Future<void> editWorkdayIndex(
      {required int index, required WorkDay value}) async {
    await workDaysStoreProvider.editWorkdayIndexInHive(
        value: value, index: index);
  }
}
