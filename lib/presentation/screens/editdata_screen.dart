import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_work_timecalculate/presentation/mobx/store_editdata_screen.dart';
import 'package:intl/intl.dart';
import '../../data/theme.dart';
import '../widgets/day_night_widget.dart';

class EditDataScreen extends StatefulWidget {
  final int indexWorkDay;
  const EditDataScreen({
    Key? key,
    required this.indexWorkDay,
  }) : super(key: key);

  @override
  State<EditDataScreen> createState() => _EditDataScreenState();
}

class _EditDataScreenState extends State<EditDataScreen> {
  final store = StoreEditData();
  void initstore() {
    store.indexstore = widget.indexWorkDay;
    store.loadDataFromStore();
  }

  @override
  void initState() {
    super.initState();
    initstore();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: const Text('редактирование')),
        body: SafeArea(
          child: Container(
            child: store.isLoaded
                ? SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 5.0),
                          Text('редактирование смены',
                              textAlign: TextAlign.left,
                              softWrap: true,
                              style: Theme.of(context).textTheme.subtitle1),

                          //              DAY / NIGHT

                          Card(
                            color:
                                store.workDayChange ? colorPwhite : colorPblack,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  DayNightWidget(value: store.workDayChange),
                                  const SizedBox(width: 10.0),
                                  Text(
                                      DateFormat('dd.MM.yy')
                                          .format(store.currentBeginDate),
                                      textAlign: TextAlign.left,
                                      softWrap: true,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(height: 10.0),
                          Text('начало смены',
                              textAlign: TextAlign.left,
                              softWrap: true,
                              style: Theme.of(context).textTheme.subtitle1),

                          //            //   Time begin

                          Card(
                            color:
                                store.workDayChange ? colorPwhite : colorPblack,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          ' ${store.currentBeginDate.getTime()}',
                                          textAlign: TextAlign.left,
                                          softWrap: true,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4),
                                      const SizedBox(width: 10.0),
                                      ElevatedButton(
                                        child: const Text('изменить время'),
                                        onPressed: () {
                                          store.setTimeBegin(context);
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

                          //            //   Time finish

                          Card(
                            color:
                                store.workDayChange ? colorPwhite : colorPblack,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          DateFormat('dd.MM.yy')
                                              .format(store.currentFinishDate),
                                          textAlign: TextAlign.left,
                                          softWrap: true,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4),
                                    ],
                                  ),
                                  Divider(color: Colors.black.withOpacity(0.5)),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          ' ${store.currentFinishDate.getTime()}',
                                          textAlign: TextAlign.left,
                                          softWrap: true,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4),
                                      const SizedBox(width: 10.0),
                                      ElevatedButton(
                                        child: const Text('изменить время'),
                                        onPressed: () {
                                          store.setTimeFinish(context);
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Text(
                              'продолжительность смены ${store.currentDuration.to24hours()}',
                              textAlign: TextAlign.left,
                              softWrap: true,
                              style: Theme.of(context).textTheme.subtitle1),

                          //             // duration

                          Card(
                            color:
                                store.workDayChange ? colorPwhite : colorPblack,
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1),
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Text('loading...'),
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                heroTag: "btn6",
                tooltip: 'удалить смену',
                backgroundColor: colorMainP,
                onPressed: () => store.goMainScreenDeleteDay(context),
                child: Icon(
                  Icons.delete,
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
              FloatingActionButton(
                heroTag: "btn5",
                tooltip: 'назад',
                backgroundColor: colorMainP2,
                onPressed: () => store.goMainScreenNotSave(context),
                child: Icon(
                  Icons.chevron_left,
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
              FloatingActionButton(
                heroTag: "btn4",
                tooltip: 'сохранить',
                backgroundColor: colorMainG,
                onPressed: () => store.goMainScreenSaveData(context),
                child: Icon(
                  Icons.save,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

extension TimeOfDayConverter on TimeOfDay {
  String to24hours() {
    final hour = this.hour.toString().padLeft(2, "0");
    final min = minute.toString().padLeft(2, "0");
    return "$hour:$min";
  }
}

extension DurationConverter on Duration {
  String to24hours() {
    int minutes = this.inMinutes.toInt() % 60;
    int hours = this.inHours.toInt();
    final hour = hours.toString().padLeft(2, "0");
    final min = minutes.toString().padLeft(2, "0");
    return "$hour:$min";
  }
}
