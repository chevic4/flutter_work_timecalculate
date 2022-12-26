import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_work_timecalculate/presentation/mobx/store_setting_screen.dart';
import 'package:intl/intl.dart';
import '../../data/theme.dart';
import '../widgets/day_night_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('значения по умолчанию'),
      ),
      body: const SafeArea(child: SettingScreenBody()),
    );
  }
}

class SettingScreenBody extends StatefulWidget {
  const SettingScreenBody({super.key});

  @override
  State<SettingScreenBody> createState() => _SettingScreenBodyState();
}

class _SettingScreenBodyState extends State<SettingScreenBody> {
  final store = StoreSettingDate();

  @override
  void initState() {
    store.initDate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(10.0),
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
            const SizedBox(height: 10.0),
            Text('дата по умолчанию',
                textAlign: TextAlign.left,
                softWrap: true,
                style: Theme.of(context).textTheme.subtitle1),

//            //   DATE begin

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
                          Text(DateFormat('dd.MM.yy').format(store.beginDate),
                              textAlign: TextAlign.left,
                              softWrap: true,
                              style: Theme.of(context).textTheme.headline4),
                          const SizedBox(width: 10.0),
                          ElevatedButton(
                            child: const Text('изменить дату'),
                            onPressed: () {
                              store.setDateBegin(context);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
            const SizedBox(height: 10.0),
            Text('начало по умолчанию',
                textAlign: TextAlign.left,
                softWrap: true,
                style: Theme.of(context).textTheme.subtitle1),

//            //    TIME begin

            Observer(builder: (_) {
              return Card(
                color: store.workDayChange ? colorPwhite : colorPblack,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(store.beginTime.to24hours(),
                          textAlign: TextAlign.left,
                          softWrap: true,
                          style: Theme.of(context).textTheme.headline4),
                      const SizedBox(width: 10.0),
                      ElevatedButton(
                        child: const Text('изменить время'),
                        onPressed: () {
                          store.setTimeBegin(context);
                        },
                      ),
                    ],
                  ),
                ),
              );
            }),
            const SizedBox(height: 10.0),
            Text('окончание по умолчанию',
                textAlign: TextAlign.left,
                softWrap: true,
                style: Theme.of(context).textTheme.subtitle1),

//           //    TIME finish

            Observer(builder: (_) {
              return Card(
                color: store.workDayChange ? colorPwhite : colorPblack,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(store.finishTime.to24hours(),
                          textAlign: TextAlign.left,
                          softWrap: true,
                          style: Theme.of(context).textTheme.headline4),
                      const SizedBox(width: 10.0),
                      ElevatedButton(
                        child: const Text('изменить время'),
                        onPressed: () {
                          store.setTimeFinish(context);
                        },
                      ),
                    ],
                  ),
                ),
              );
            }),
            const SizedBox(height: 10.0),
            Text('продолжительность по умолчанию',
                textAlign: TextAlign.left,
                softWrap: true,
                style: Theme.of(context).textTheme.subtitle1),
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
                        label: store.minutes.round().toString(),
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
            const SizedBox(height: 15.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: const Text('назад'),
                  onPressed: () => store.goMainScreen(context),
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
