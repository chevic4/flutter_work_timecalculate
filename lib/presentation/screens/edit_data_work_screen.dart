import 'package:flutter/material.dart';
import 'package:flutter_work_timecalculate/data/data_days.dart';
import 'package:flutter_work_timecalculate/data/theme.dart';
import 'package:flutter_work_timecalculate/presentation/screens/enter_list_days_screen.dart';
import 'package:flutter_work_timecalculate/presentation/widgets/day_night_widget.dart';
import 'package:intl/intl.dart';

import '../widgets/date_format_func.dart';

class VrioEditDataScreen extends StatelessWidget {
  const VrioEditDataScreen({super.key, required this.numberOfData});
  final int numberOfData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('корректировка смены'),
      ),
      body: SafeArea(
          child: EditDataScreen(
        numberOfData: numberOfData,
      )),
    );
  }
}

class EditDataScreen extends StatefulWidget {
  const EditDataScreen({super.key, required this.numberOfData});
  final int numberOfData;
  @override
  State<EditDataScreen> createState() => _EditDataScreenState();
}

class _EditDataScreenState extends State<EditDataScreen> {
  late bool changeWorkDay;
  late DateTime currentDateBegin;
  late DateTime currentDateFinish;
  late TimeOfDay currentTimeBegin;
  late TimeOfDay currentTimeFinish;
  late Duration _currentDuration;
  late double _sliderValueMinuts;
  late double _sliderValueHours;
  late DateTime _temp;
  @override
  void initState() {
    super.initState();
    currentDateBegin = DataWorking.data[widget.numberOfData].beginWork;
    currentDateFinish = DataWorking.data[widget.numberOfData].finishWork;
    currentTimeBegin = TimeOfDay.fromDateTime(currentDateBegin);
    currentTimeFinish = TimeOfDay.fromDateTime(currentDateFinish);
    _currentDuration = DataWorking.data[widget.numberOfData].workTime;
    _sliderValueHours = _currentDuration.inHours.toDouble();
    _sliderValueMinuts = _currentDuration.inMinutes.toInt() % 60;
    currentDateBegin.hour > 17 ? changeWorkDay = false : changeWorkDay = true;
  }

  _selectTimeFinish(BuildContext contex) async {
    final TimeOfDay? _selected = await showTimePicker(
      context: context,
      initialTime: currentTimeFinish,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: colorMainG,
              onPrimary: Colors.black45,
              onSurface: Colors.blueGrey,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: Colors.grey),
            ),
          ),
          child: child!,
        );
      },
    );
    _temp = DateTime(
      currentDateFinish.year,
      currentDateFinish.month,
      currentDateFinish.day,
      _selected!.hour,
      _selected.minute,
    );
    if (_selected != currentTimeFinish &&
        _selected != null &&
        _temp.isAfter(currentDateBegin)) {
      setState(() {
        currentTimeFinish = _selected;
        currentDateFinish = DateTime(
          currentDateFinish.year,
          currentDateFinish.month,
          currentDateFinish.day,
          currentTimeFinish.hour,
          currentTimeFinish.minute,
        );
        _currentDuration = currentDateFinish.difference(currentDateBegin);
        _sliderValueHours = _currentDuration.inHours.toDouble();
        _sliderValueMinuts = _currentDuration.inMinutes.toInt() % 60;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String languageCode = Localizations.localeOf(context).languageCode;
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('смена для корректировки',
              textAlign: TextAlign.left,
              softWrap: true,
              style: Theme.of(context).textTheme.subtitle1),
          const SizedBox(height: 10.0),
          Card(
            color: changeWorkDay ? colorPwhite : colorPblack,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: 10.0),
                      Text(
                          DateFormat('dd MMMM ', languageCode)
                              .format(currentDateBegin),
                          textAlign: TextAlign.left,
                          softWrap: true,
                          style: Theme.of(context).textTheme.headline4),
                    ],
                  ),
                  Divider(color: Colors.black.withOpacity(0.5)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DayNightWidget(value: changeWorkDay),
                      const SizedBox(width: 10.0),
                      Text(' ${currentTimeBegin.to24hours()}',
                          textAlign: TextAlign.left,
                          softWrap: true,
                          style: Theme.of(context).textTheme.headline4),
                      const SizedBox(width: 10.0),
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
                      Text(DateFormat('dd.MM.yy').format(currentDateFinish),
                          textAlign: TextAlign.left,
                          softWrap: true,
                          style: Theme.of(context).textTheme.headline4),
                      const SizedBox(width: 10.0),
                    ],
                  ),
                  Divider(
                    color: Colors.black.withOpacity(0.5),
                  ),
                  // время окончания
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(' ${currentTimeFinish.to24hours()}',
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
          const SizedBox(height: 10.0),
          Text('продолжительность смены',
              textAlign: TextAlign.left,
              softWrap: true,
              style: Theme.of(context).textTheme.subtitle1),
          Card(
            color: changeWorkDay ? colorPwhite : colorPblack,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(format(_currentDuration),
                      textAlign: TextAlign.left,
                      softWrap: true,
                      style: Theme.of(context).textTheme.headline4),
                  Divider(
                    color: Colors.black.withOpacity(0.5),
                  ),
                  Column(
                    children: [
                      Slider(
                        min: 0,
                        max: 24,
                        divisions: 24,
                        label: _sliderValueHours.round().toString(),
                        value: _sliderValueHours,
                        onChanged: (value) {
                          setState(() {
                            _sliderValueHours = value;
                            _currentDuration = Duration(
                                hours: _sliderValueHours.round(),
                                minutes: _sliderValueMinuts.round());
                            currentDateFinish =
                                currentDateBegin.add(_currentDuration);
                            currentTimeFinish =
                                TimeOfDay.fromDateTime(currentDateFinish);
                          });
                        },
                      ),
                      Text('часы',
                          textAlign: TextAlign.left,
                          softWrap: true,
                          style: Theme.of(context).textTheme.subtitle1),
                      Slider(
                        min: 0,
                        max: 55,
                        divisions: 11,
                        label: _sliderValueMinuts.round().toString(),
                        value: _sliderValueMinuts,
                        onChanged: (value) {
                          setState(() {
                            _sliderValueMinuts = value;
                            _currentDuration = Duration(
                                hours: _sliderValueHours.round(),
                                minutes: _sliderValueMinuts.round());
                            currentDateFinish =
                                currentDateBegin.add(_currentDuration);
                            currentTimeFinish =
                                TimeOfDay.fromDateTime(currentDateFinish);
                          });
                        },
                      ),
                      Text('минуты',
                          textAlign: TextAlign.left,
                          softWrap: true,
                          style: Theme.of(context).textTheme.subtitle1),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorMainP,
                ),
                child: const Text('удалить смену'),
                onPressed: () {
                  DataWorking.data.removeAt(widget.numberOfData);
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const EnterWorkDays(),
                    ),
                  );
                },
              ),
              ElevatedButton(
                child: const Text('сохранить'),
                onPressed: () {
                  currentDateBegin = DateTime(
                      currentDateBegin.year,
                      currentDateBegin.month,
                      currentDateBegin.day,
                      currentTimeBegin.hour,
                      currentTimeBegin.minute);
                  currentDateFinish = DateTime(
                      currentDateFinish.year,
                      currentDateFinish.month,
                      currentDateFinish.day,
                      currentTimeFinish.hour,
                      currentTimeFinish.minute);
                  WorkDay value = WorkDay(
                    beginWork: currentDateBegin,
                    finishWork: currentDateFinish,
                    workTime: currentDateFinish.difference(currentDateBegin),
                  );
                  DataWorking.data[widget.numberOfData] = value;
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const EnterWorkDays(),
                  ));
                },
              ),
            ],
          ),
          const SizedBox(height: 15.0),
          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const EnterWorkDays(),
                ));
              },
              child: const Text('назад'),
            ),
          )
        ]),
      ),
    );
  }
}

double _timeToDouble(TimeOfDay myTime) => myTime.hour + myTime.minute / 60.0;

Duration _intToDuration(double value) {
  int h = value ~/ 60;
  int m = value.toInt() % 60;
  Duration result = Duration(hours: h, minutes: m);
  return result;
}

int _formMin(double value) {
  int result = value.round();
  return result;
}
