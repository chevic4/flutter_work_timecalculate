import 'package:mobx/mobx.dart';
part 'state_enter_date_work_screen.g.dart';

class StoreDate = _StoreDate with _$StoreDate;

abstract class _StoreDate with Store {
  @observable
  bool workDayChange = true;

  @observable
  late DateTime workDaybeginDate = getDate();
  @observable
  late DateTime workDayfinishDate = getFinishDate();

  DateTime getDate() {
    DateTime result = DateTime.now();


    //return DateTime.now();
    return result;
  }

  DateTime getFinishDate() {
    // DateTime result;
    // if (workDayChange == true) {
    //   result = DateTime(
    //     workDaybeginDate.year,
    //     workDaybeginDate.month,
    //     workDaybeginDate.day,
    //     workDaybeginDate.hour + 9,
    //     workDaybeginDate.minute,
    //   );
    // } else {
    //   result = DateTime(
    //     workDaybeginDate.year,
    //     workDaybeginDate.month,
    //     workDaybeginDate.day + 1,
    //     12,
    //     30,
    //   );
    // }
    // return result;
    return DateTime.now();
  }

  void setWorkDaybeginDateValue(DateTime value) {
    workDaybeginDate = value;
    print('setWorkDaybeginDateValue ${workDaybeginDate}');
  }

  void changeWorkDayValue() {
    workDayChange ? workDayChange = false : workDayChange = true;
    workDaybeginDate = getDate();
    workDayfinishDate = getFinishDate();
  }

  //   if (changeWorkDay != true) {
  //     workDaybeginTime = const TimeOfDay(hour: 18, minute: 20);
  //     workDayfinishTime = const TimeOfDay(hour: 12, minute: 20);
  //     workDayfinishDate = DateTime(workDaybeginDate.year,
  //         workDaybeginDate.month, workDaybeginDate.day + 1);
  //   } else {
  //     workDaybeginTime = const TimeOfDay(hour: 06, minute: 50);
  //     workDayfinishTime = const TimeOfDay(hour: 21, minute: 00);
  //     workDayfinishDate = DateTime(workDaybeginDate.year,
  //         workDaybeginDate.month, workDaybeginDate.day);
  //   }
  // });

}

// flutter pub run build_runner build