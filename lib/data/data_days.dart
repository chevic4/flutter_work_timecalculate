class DataWorking {
  DataWorking._();
  static List<WorkDay> data = [];
  static final instance = DataWorking._();
}

class WorkDay {
  DateTime beginWork;
  DateTime finishWork;
  Duration workTime;
  WorkDay({
    required this.beginWork,
    required this.finishWork,
    required this.workTime,
  });
}
