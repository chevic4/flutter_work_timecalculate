import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_work_timecalculate/presentation/mobx/store_enterdata_screen.dart';
import 'package:intl/intl.dart';
import '../../data/theme.dart';
import '../widgets/day_night_widget.dart';

class EnterDataScreen extends StatelessWidget {
  const EnterDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('новая смена')),
      body: const SafeArea(child: EnterScreenBody()),
    );
  }
}

class EnterScreenBody extends StatefulWidget {
  const EnterScreenBody({super.key});

  @override
  State<EnterScreenBody> createState() => _EnterScreenBodyState();
}

class _EnterScreenBodyState extends State<EnterScreenBody> {
  final store = StoreEnterData();

  @override
  void initState() {
    store.initStore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('настройка смены',
                textAlign: TextAlign.left,
                softWrap: true,
                style: Theme.of(context).textTheme.subtitle1),

//              DAY / NIGHT

            Observer(builder: (_) {
              return Card(
                color: store.workDayChange ? colorPwhite : colorPblack,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DayNightTextWidget(value: store.workDayChange),
                      DayNightWidget(value: store.workDayChange),
                      ElevatedButton(
                        onPressed: store.changeWorkDayValue,
                        child: const Text('поменять'),
                      ),
                    ],
                  ),
                ),
              );
            }),

            const SizedBox(height: 5.0),
            Text('начало смены',
                textAlign: TextAlign.left,
                softWrap: true,
                style: Theme.of(context).textTheme.subtitle1),

//            //   DAY begin

            Observer(builder: (_) {
              return Card(
                color: store.workDayChange ? colorPwhite : colorPblack,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              DateFormat('dd.MM.yy')
                                  .format(store.currentBeginDate),
                              textAlign: TextAlign.left,
                              softWrap: true,
                              style: Theme.of(context).textTheme.headline4),
                          const SizedBox(width: 10.0),
                          ElevatedButton(
                            child: const Text('изменить дату'),
                            onPressed: () => store.setDateBegin(context),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.black.withOpacity(0.5),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(' ${store.currentBeginDate.getTime()}',
                              textAlign: TextAlign.left,
                              softWrap: true,
                              style: Theme.of(context).textTheme.headline4),
                          const SizedBox(width: 10.0),
                          ElevatedButton(
                            child: const Text('изменить время'),
                            onPressed: () => store.setTimeBegin(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),

            const SizedBox(height: 5.0),
            Text('окончание смены',
                textAlign: TextAlign.left,
                softWrap: true,
                style: Theme.of(context).textTheme.subtitle1),

//            //   DAY finish

            Observer(builder: (_) {
              return Card(
                color: store.workDayChange ? colorPwhite : colorPblack,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              DateFormat('dd.MM.yy')
                                  .format(store.currentFinishDate),
                              textAlign: TextAlign.left,
                              softWrap: true,
                              style: Theme.of(context).textTheme.headline4),
                          const SizedBox(width: 8.0),
                        ],
                      ),
                      Divider(
                        color: Colors.black.withOpacity(0.5),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(' ${store.currentFinishDate.getTime()}',
                              textAlign: TextAlign.left,
                              softWrap: true,
                              style: Theme.of(context).textTheme.headline4),
                          const SizedBox(width: 8.0),
                          ElevatedButton(
                            child: const Text('изменить время'),
                            onPressed: () => store.setTimeFinish(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),

            Text('продолжительность по умолчанию',
                textAlign: TextAlign.left,
                softWrap: true,
                style: Theme.of(context).textTheme.subtitle1),

//             // duration

            Observer(builder: (_) {
              return Card(
                color: store.workDayChange ? colorPwhite : colorPblack,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Slider(
                        min: 0,
                        max: 24,
                        divisions: 24,
                        label: store.hours.round().toString(),
                        value: store.hours,
                        onChanged: store.setHours,
                      ),
                      Text('часы',
                          textAlign: TextAlign.left,
                          softWrap: true,
                          style: Theme.of(context).textTheme.subtitle1),
                      Slider(
                        min: 0,
                        max: 55,
                        divisions: 11,
                        label: store.minutes.toString(),
                        value: store.minutes,
                        onChanged: store.setMinutes,
                      ),
                      Text('минуты',
                          textAlign: TextAlign.left,
                          softWrap: true,
                          style: Theme.of(context).textTheme.subtitle1),
                    ],
                  ),
                ),
              );
            }),

//             // buttons

            const SizedBox(height: 10.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  child: const Text('отмена'),
                  onPressed: () => store.goMainScreenNotSave(context),
                ),
                ElevatedButton(
                  child: const Text('сохранить'),
                  onPressed: () => store.goMainScreenSave(context),
                ),
              ],
            ),
          ],
        ),
      ),
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

extension DateTimeparsingTime on DateTime {
  String getTime() {
    final hour = this.hour.toString().padLeft(2, "0");
    final min = minute.toString().padLeft(2, "0");
    return "$hour:$min";
  }
}
