import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_work_timecalculate/domain/entity/workday.dart';

class WorkDayProvider {
  final sharedPreferences = SharedPreferences.getInstance();
  WorkDay workDay = WorkDay(
      beginWork: DateTime(1999, 9, 9, 9, 9, 9),
      finishWork: DateTime(1999, 9, 9, 9, 9, 9));

  // Future<void> saveWorkDayDefault() async {
  //   List<String> store = [
  //     workDay.beginWork.toIso8601String(),
  //     workDay.finishWork.toIso8601String(),
  //   ];
  //   (await sharedPreferences).setStringList('defaultWorkDay', store);
  // }

  // Future<void> loadWorkDayDefault() async {
  //   final store = (await sharedPreferences).getStringList('defaultWorkDay');
  //   if (store!.first != null) {
  //     workDay.beginWork = DateTime.parse(store.first);
  //     workDay.finishWork = DateTime.parse(store.last);
  //   } else {
  //     workDay.beginWork = DateTime(1999, 9, 9, 9, 9, 9);
  //     workDay.finishWork = DateTime(1999, 9, 9, 9, 9, 9);
  //   }
  // }
}
