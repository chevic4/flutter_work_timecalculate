import 'package:flutter_work_timecalculate/domain/entity/workday.dart';
import 'package:hive/hive.dart';

const nameHiveStore = 'HiveStore';

class WorkDaysStoreProvider {
  List<WorkDay> workDays = [];

  Future<List<WorkDay>> getWorkDaysFromHive() async {
    List<WorkDay> result = [];
    final store = await openIt();
    result.addAll(store.values);
    await closeIt();
    return result;
  }

  Future<WorkDay> getWorkdayIndexFromHive(int index) async {
    final store = await openIt();
    WorkDay result = store.getAt(index)!;
    await closeIt();
    return result;
  }

  Future<void> addWorkdayToHive(WorkDay value) async {
    final store = await openIt();
    store.add(value);
    await closeIt();
  }

  Future<void> deleteWorkdayIndexFromHive(int index) async {
    final store = await openIt();
    if (index <= store.length) {
      store.deleteAt(index);
    }
    await closeIt();
  }

  Future<void> editWorkdayIndexInHive(
      {required WorkDay value, required int index}) async {
    final store = await openIt();
    if (index <= store.length) {
      store.putAt(index, value);
    }
    await closeIt();
  }
}

Future<Box<WorkDay>> openIt() async {
  Box<WorkDay> connectionBox = await Hive.openBox<WorkDay>(nameHiveStore);
  if (Hive.isBoxOpen(nameHiveStore) == false) {
    await Hive.openBox(nameHiveStore);
  } else {
    await connectionBox.close();
    connectionBox = await Hive.openBox(nameHiveStore);
  }
  return connectionBox;
}

Future<void> closeIt() async {
  return Hive.isBoxOpen(nameHiveStore) ? await Hive.close() : '';
}
