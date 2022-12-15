import 'package:flutter_work_timecalculate/domain/entity/workday.dart';
import 'package:flutter_work_timecalculate/domain/services/workday_service_provider.dart';

class WorkDayService {
  final workDataProvider = WorkDayProvider();
  WorkDay get workDayDefault => workDataProvider.workDay;

  // Future<void> initworkDayDefault() async {
  //   await workDataProvider.loadWorkDayDefault();
  // }
}
