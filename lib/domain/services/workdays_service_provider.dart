import 'package:flutter_work_timecalculate/domain/entity/workday.dart';
import 'package:hive/hive.dart';

const nameHiveStore = 'HiveStore';

class WorkDaysStoreProvider {
  List<WorkDay> workDays = [];

  Future<List<WorkDay>> getWorkDaysFromHive() async {
    List<WorkDay> result = [];
    final store = await Hive.openBox<WorkDay>(nameHiveStore);
    result.addAll(store.values);
    store.close();
    return result;
  }

  Future<WorkDay> getWorkdayIndexFromHive(int index) async {
    final store = await Hive.openBox<WorkDay>(nameHiveStore);
    WorkDay result = store.getAt(index)!;
    store.close();
    return result;
  }

  Future<void> addWorkdayToHive(WorkDay value) async {
    final store = await Hive.openBox<WorkDay>(nameHiveStore);
    store.add(value);
    store.close();
  }

  Future<void> deleteWorkdayIndexFromHive(int index) async {
    final store = await Hive.openBox<WorkDay>(nameHiveStore);
    if (index <= store.length) {
      store.deleteAt(index);
    }
    store.close();
  }

  Future<void> editWorkdayIndexInHive(
      {required WorkDay value, required int index}) async {
    final store = await Hive.openBox<WorkDay>(nameHiveStore);
    if (index <= store.length) {
      store.putAt(index, value);
    }
    store.close();
  }
}
