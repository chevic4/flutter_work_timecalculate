import 'package:flutter/material.dart';
import 'package:flutter_work_timecalculate/presentation/mobx/state_setting_screen.dart';
import '../../data/theme.dart';
import '../widgets/day_night_widget.dart';
import 'enter_list_days_screen.dart';

class EnterScreenDI extends StatelessWidget {
  const EnterScreenDI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('новая смена')),
      body: const SafeArea(child: EnterScreen()),
    );
  }
}

class EnterScreen extends StatefulWidget {
  const EnterScreen({super.key});

  @override
  State<EnterScreen> createState() => _EnterScreenState();
}

class _EnterScreenState extends State<EnterScreen> {
  final store = StoreSettingDate();

  @override
  void initState() {
    // store.initDate();
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
            const SizedBox(height: 5.0),
            Text('настройка смены',
                textAlign: TextAlign.left,
                softWrap: true,
                style: Theme.of(context).textTheme.subtitle1),

//              DAY / NIGHT

            Card(
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
            ),

            const SizedBox(height: 10.0),
            Text('начало смены',
                textAlign: TextAlign.left,
                softWrap: true,
                style: Theme.of(context).textTheme.subtitle1),

//            //   DAY begin

            Card(
              //  color: changeWorkDay ? colorPwhite : colorPblack,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('data',
                            //  Text(DateFormat('dd.MM.yy').format(workDaybeginDate),
                            textAlign: TextAlign.left,
                            softWrap: true,
                            style: Theme.of(context).textTheme.headline4),
                        const SizedBox(width: 10.0),
                        ElevatedButton(
                          child: const Text('изменить дату'),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.black.withOpacity(0.5),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('ewew',
                            // Text(' ${workDaybeginTime.to24hours()}',
                            textAlign: TextAlign.left,
                            softWrap: true,
                            style: Theme.of(context).textTheme.headline4),
                        const SizedBox(width: 10.0),
                        ElevatedButton(
                          child: const Text('изменить время'),
                          onPressed: () {},
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

//            //   DAY finish

            Card(
              //   color: changeWorkDay ? colorPwhite : colorPblack,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Text(DateFormat('dd.MM.yy').format(workDaybeginDate),
                        Text('DateF',
                            textAlign: TextAlign.left,
                            softWrap: true,
                            style: Theme.of(context).textTheme.headline4),
                        const SizedBox(width: 10.0),
                        ElevatedButton(
                          child: const Text('изменить дату'),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.black.withOpacity(0.5),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Text(' ${workDaybeginTime.to24hours()}',
                        Text('dwor',
                            textAlign: TextAlign.left,
                            softWrap: true,
                            style: Theme.of(context).textTheme.headline4),
                        const SizedBox(width: 10.0),
                        ElevatedButton(
                          child: const Text('изменить время'),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Text('продолжительность по умолчанию',
                textAlign: TextAlign.left,
                softWrap: true,
                style: Theme.of(context).textTheme.subtitle1),

//             // duration

            Card(
              //  color: store.workDayChange ? colorPwhite : colorPblack,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Slider(
                      min: 0,
                      max: 24,
                      divisions: 24,
                      label: 'we',
                      value: 20.0,
                      //label: store.hours.round().toString(),
                      // value: store.hours,
                      onChanged: null,
                    ),
                    Text('часы',
                        textAlign: TextAlign.left,
                        softWrap: true,
                        style: Theme.of(context).textTheme.subtitle1),
                    Slider(
                      min: 0,
                      max: 55,
                      divisions: 11,
                      label: 'we',
                      value: 20.0,
                      // label: store.minutes.round().toString(),
                      // value: store.minutes,
                      onChanged: null,
                    ),
                    Text('минуты',
                        textAlign: TextAlign.left,
                        softWrap: true,
                        style: Theme.of(context).textTheme.subtitle1),
                  ],
                ),
              ),
            ),

//             // buttons

            const SizedBox(height: 15.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  child: const Text('отмена'),
                  onPressed: () {
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
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const EnterWorkDays(),
                      ),
                    );
                  },
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
