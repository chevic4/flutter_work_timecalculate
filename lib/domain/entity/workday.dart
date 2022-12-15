class WorkDay {
  DateTime beginWork;
  DateTime finishWork;
  //Duration workTime;
  WorkDay({
    required this.beginWork,
    required this.finishWork,
    //  required this.workTime,
  });

  Duration getDuration() {
    return finishWork.difference(beginWork);
  }
}
