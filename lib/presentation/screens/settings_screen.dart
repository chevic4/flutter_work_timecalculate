import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_work_timecalculate/presentation/mobx/store_setting_screen.dart';
import 'package:flutter_work_timecalculate/presentation/widgets/text_fonts.dart';
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextSubTitle1(value: 'настройка смены'),

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
            TextSubTitle1(value: 'дата по умолчанию'),

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
                          TextHeadline4(
                              value: DateFormat('dd.MM.yy')
                                  .format(store.beginDate)),
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
            const SizedBox(height: 5.0),
            TextSubTitle1(value: 'начало по умолчанию'),

//            //    TIME begin

            Observer(builder: (_) {
              return Card(
                color: store.workDayChange ? colorPwhite : colorPblack,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextHeadline4(value: store.beginTime.to24hours()),
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
            const SizedBox(height: 5.0),
            TextSubTitle1(value: 'окончание по умолчанию'),

//           //    TIME finish

            Observer(builder: (_) {
              return Card(
                color: store.workDayChange ? colorPwhite : colorPblack,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextHeadline4(value: store.finishTime.to24hours()),
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
            const SizedBox(height: 5.0),
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
                      TextSubTitle1(value: 'часы'),
                      Slider(
                        min: 0,
                        max: 55,
                        divisions: 11,
                        label: store.minutes.round().toString(),
                        value: store.minutes,
                        onChanged: store.setMinutes,
                      ),
                      TextSubTitle1(value: 'минуты'),
                    ],
                  ),
                ),
              );
            }),
            const SizedBox(height: 10.0),
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
