import 'package:flutter/material.dart';
import 'package:flutter_work_timecalculate/data/data_days.dart';
import 'package:flutter_work_timecalculate/data/theme.dart';
import 'package:flutter_work_timecalculate/presentation/screens/enter_list_days_screen.dart';
import 'package:flutter_work_timecalculate/presentation/widgets/day_night_widget.dart';
import 'package:intl/intl.dart';

import 'enter_date_work_screen.dart';

class VrioEnterDataScreen extends StatelessWidget {
  const VrioEnterDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('данные о смене'),
      ),
    //  body: const SafeArea(child: EnterDataScreen()),
      body: const SafeArea(child: EnterDateScreen()),
    );
  }
}

class EnterDataScreen extends StatefulWidget {
  const EnterDataScreen({super.key});

  @override
  State<EnterDataScreen> createState() => _EnterDataScreenState();
}

class _EnterDataScreenState extends State<EnterDataScreen> {
  bool changeWorkDay = true;
  TimeOfDay workDaybeginTime = const TimeOfDay(hour: 06, minute: 50);
  TimeOfDay workDayfinishTime = const TimeOfDay(hour: 21, minute: 00);
  final currentDateBegin = DataWorking.data.isEmpty
      ? DateTime.now()
      : DataWorking.data.last.beginWork;
  final currentDateFinish = DataWorking.data.isEmpty
      ? DateTime.now()
      : DataWorking.data.last.beginWork;
  late DateTime workDaybeginDate = currentDateBegin;
  late DateTime workDayfinishDate = currentDateBegin;
  late TextEditingController _controller;
  _changeWorkDay() {
    changeWorkDay ? changeWorkDay = false : changeWorkDay = true;
    setState(() {
      if (changeWorkDay != true) {
        workDaybeginTime = const TimeOfDay(hour: 18, minute: 20);
        workDayfinishTime = const TimeOfDay(hour: 12, minute: 20);
        workDayfinishDate = DateTime(workDaybeginDate.year,
            workDaybeginDate.month, workDaybeginDate.day + 1);
      } else {
        workDaybeginTime = const TimeOfDay(hour: 06, minute: 50);
        workDayfinishTime = const TimeOfDay(hour: 21, minute: 00);
        workDayfinishDate = DateTime(workDaybeginDate.year,
            workDaybeginDate.month, workDaybeginDate.day);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    workDaybeginDate = currentDateBegin;

    workDayfinishDate = currentDateFinish;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _selectTimeBegin(BuildContext contex) async {
    final TimeOfDay? selected = await showTimePicker(
      context: context,
      initialTime: workDaybeginTime,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: colorMainG,
              onPrimary: Colors.black45,
              onSurface: Colors.blueGrey,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey,
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (selected != null && selected != workDaybeginTime) {
      setState(() {
        workDaybeginTime = selected;
      });
    }
  }

  _selectTimeFinish(BuildContext contex) async {
    final TimeOfDay? selected = await showTimePicker(
      context: context,
      initialTime: workDayfinishTime,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: colorMainG,
              onPrimary: Colors.black45,
              onSurface: Colors.blueGrey,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey,
                //  primary: Colors.red, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (selected != null && selected != workDaybeginTime) {
      setState(() {
        workDayfinishTime = selected;
      });
    }
  }

  _selectDateBegin(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: workDaybeginDate,
      firstDate: DateTime(2021),
      lastDate: DateTime(2024),
      //themecolor
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: colorMainG,
              onPrimary: Colors.black45,
              onSurface: colorText,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: colorText,
              ),
            ),
          ),
          child: child!,
        );
      },
      //theme color
    );
    if (selected != null && selected != workDaybeginDate) {
      setState(() {
        workDaybeginDate = selected;
        if (changeWorkDay != true) {
          workDayfinishDate = DateTime(workDaybeginDate.year,
              workDaybeginDate.month, workDaybeginDate.day + 1);
        } else {
          workDayfinishDate = DateTime(workDaybeginDate.year,
              workDaybeginDate.month, workDaybeginDate.day);
        }
      });
    }
  }

  _selectDateFinish(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: workDayfinishDate,
      firstDate: DateTime(2021),
      lastDate: DateTime(2024),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: colorMainG,
              onPrimary: Colors.black45,
              onSurface: colorText,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: colorText,
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (selected != null &&
        selected != workDayfinishDate &&
        workDayfinishDate.isBefore(selected)) {
      setState(() {
        workDayfinishDate = selected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // выбор смены //день ночь
        Text('выбор смены',
            textAlign: TextAlign.left,
            softWrap: true,
            style: Theme.of(context).textTheme.subtitle1),
        Card(
          color: changeWorkDay ? colorPwhite : colorPblack,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DayNightTextWidget(value: changeWorkDay),
                DayNightWidget(value: changeWorkDay),
                ElevatedButton(
                  onPressed: () {
                    _changeWorkDay();
                  },
                  child: const Text('поменять'),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        // начало смены
        Text('начало смены',
            textAlign: TextAlign.left,
            softWrap: true,
            style: Theme.of(context).textTheme.subtitle1),
        Card(
          color: changeWorkDay ? colorPwhite : colorPblack,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(DateFormat('dd.MM.yy').format(workDaybeginDate),
                        textAlign: TextAlign.left,
                        softWrap: true,
                        style: Theme.of(context).textTheme.headline4),
                    const SizedBox(width: 10.0),
                    ElevatedButton(
                      child: const Text('изменить дату'),
                      onPressed: () {
                        _selectDateBegin(context);
                      },
                    ),
                  ],
                ),
                Divider(
                  color: Colors.black.withOpacity(0.5),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(' ${workDaybeginTime.to24hours()}',
                        textAlign: TextAlign.left,
                        softWrap: true,
                        style: Theme.of(context).textTheme.headline4),
                    const SizedBox(width: 10.0),
                    ElevatedButton(
                      child: const Text('изменить время'),
                      onPressed: () {
                        _selectTimeBegin(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        Text('окончание смены',
            textAlign: TextAlign.left,
            softWrap: true,
            style: Theme.of(context).textTheme.subtitle1),
        Card(
          color: changeWorkDay ? colorPwhite : colorPblack,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(DateFormat('dd.MM.yy').format(workDayfinishDate),
                        textAlign: TextAlign.left,
                        softWrap: true,
                        style: Theme.of(context).textTheme.headline4),
                    const SizedBox(width: 10.0),
                    ElevatedButton(
                      child: const Text('изменить дату'),
                      onPressed: () {
                        _selectDateFinish(context);
                      },
                    ),
                  ],
                ),
                Divider(
                  color: Colors.black.withOpacity(0.5),
                ),
                // время окончания
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(' ${workDayfinishTime.to24hours()}',
                        textAlign: TextAlign.left,
                        softWrap: true,
                        style: Theme.of(context).textTheme.headline4),
                    const SizedBox(width: 10.0),
                    ElevatedButton(
                      child: const Text('изменить время'),
                      onPressed: () {
                        _selectTimeFinish(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 15.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('назад'),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const EnterWorkDays(),
                ));
              },
            ),
            const SizedBox(width: 10.0),
            ElevatedButton(
              child: const Text('сохранить'),
              onPressed: () {
                workDaybeginDate = DateTime(
                    workDaybeginDate.year,
                    workDaybeginDate.month,
                    workDaybeginDate.day,
                    workDaybeginTime.hour,
                    workDaybeginTime.minute);
                workDayfinishDate = DateTime(
                    workDayfinishDate.year,
                    workDayfinishDate.month,
                    workDayfinishDate.day,
                    workDayfinishTime.hour,
                    workDayfinishTime.minute);
                WorkDay value = WorkDay(
                  beginWork: workDaybeginDate,
                  finishWork: workDayfinishDate,
               //   workTime: workDayfinishDate.difference(workDaybeginDate),
                );
                DataWorking.data.add(value);
                data.sort((a, b) => a.beginWork.compareTo(b.beginWork));
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const EnterWorkDays(),
                ));
              },
            ),
          ],
        ),
      ]),
    );
  }
}

extension TimeOfDayConverter on TimeOfDay {
  String to24hours() {
    final hour = this.hour.toString().padLeft(2, "0");
    final min = minute.toString().padLeft(2, "0");
    return "$hour:$min";
  }
}
