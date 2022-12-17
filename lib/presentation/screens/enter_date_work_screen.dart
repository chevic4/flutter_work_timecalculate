import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_work_timecalculate/presentation/screens/enter_list_days_screen.dart';
import 'package:flutter_work_timecalculate/presentation/widgets/select_date_widget.dart';
import 'package:intl/intl.dart';
import '../../data/theme.dart';
import '../mobx/state_enter_date_work_screen.dart';
import '../widgets/day_night_widget.dart';

class EnterDateScreen extends StatefulWidget {
  const EnterDateScreen({super.key});

  @override
  State<EnterDateScreen> createState() => _EnterDateScreenState();
}

class _EnterDateScreenState extends State<EnterDateScreen> {
  final store = StoreDate();
  DateTime workDaybeginDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('выбор смены',
              textAlign: TextAlign.left,
              softWrap: true,
              style: Theme.of(context).textTheme.subtitle1),
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
          // начало смены
          Text('начало смены',
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            DateFormat('dd.MM.yy')
                                .format(store.workDaybeginDate),
                            textAlign: TextAlign.left,
                            softWrap: true,
                            style: Theme.of(context).textTheme.headline4),
                        const SizedBox(width: 10.0),
                        ElevatedButton(
                          child: const Text('изменить дату'),
                          onPressed: () async {
                            store.workDaybeginDate =
                                await selectDate(context, workDaybeginDate);
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
                        Text(
                            ' ${store.workDaybeginDate.hour}:${store.workDaybeginDate.minute}',
                            textAlign: TextAlign.left,
                            softWrap: true,
                            style: Theme.of(context).textTheme.headline4),
                        const SizedBox(width: 10.0),
                        ElevatedButton(
                          child: const Text('изменить время'),
                          onPressed: () async {
                            // store.workDaybeginDate = await selectTime(
                            //    context, store.workDaybeginDate);
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
          Text('окончание смены',
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            DateFormat('dd.MM.yy')
                                .format(store.workDayfinishDate),
                            textAlign: TextAlign.left,
                            softWrap: true,
                            style: Theme.of(context).textTheme.headline4),
                        const SizedBox(width: 10.0),
                        ElevatedButton(
                          child: const Text('изменить дату'),
                          onPressed: () async {
                            store.workDayfinishDate =
                                await selectDate(context, workDaybeginDate);
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
                        Text(
                            ' ${store.workDayfinishDate.hour}:${store.workDayfinishDate.minute}',
                            textAlign: TextAlign.left,
                            softWrap: true,
                            style: Theme.of(context).textTheme.headline4),
                        const SizedBox(width: 10.0),
                        ElevatedButton(
                          child: const Text('изменить время'),
                          onPressed: () async {
                            //  store.workDayfinishDate = await selectTime(
                            //      context, store.workDayfinishDate);
                          },
                        ),
                      ],
                    ),
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
                  // workDaybeginDate = DateTime(
                  //     workDaybeginDate.year,
                  //     workDaybeginDate.month,
                  //     workDaybeginDate.day,
                  //     workDaybeginTime.hour,
                  //     workDaybeginTime.minute);
                  // workDayfinishDate = DateTime(
                  //     workDayfinishDate.year,
                  //     workDayfinishDate.month,
                  //     workDayfinishDate.day,
                  //     workDayfinishTime.hour,
                  //     workDayfinishTime.minute);
                  // WorkDay value = WorkDay(
                  //   beginWork: workDaybeginDate,
                  //   finishWork: workDayfinishDate,
                  //   workTime: workDayfinishDate.difference(workDaybeginDate),
                  //  ),
                  //  DataWorking.data.add(value);
                  // data.sort((a, b) => a.beginWork.compareTo(b.beginWork));
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const EnterWorkDays(),
                  ));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
