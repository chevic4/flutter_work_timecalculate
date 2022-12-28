import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_work_timecalculate/presentation/mobx/store_editdata_screen.dart';
import 'package:flutter_work_timecalculate/presentation/widgets/text_fonts.dart';
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
                          TextSubTitle1(value: 'редактирование смены'),

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
                                  TextHeadline4(
                                      value: DateFormat('dd.MM.yy')
                                          .format(store.currentBeginDate)),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(height: 10.0),
                          TextSubTitle1(value: 'начало смены'),

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
                                      TextHeadline4(
                                          value:
                                              ' ${store.currentBeginDate.getTime()}'),
                                      const SizedBox(width: 10.0),
                                      ElevatedButton(
                                        child: const Text('изменить время'),
                                        onPressed: () =>
                                            store.setTimeBegin(context),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          TextSubTitle1(value: 'окончание смены'),

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
                                      TextHeadline4(
                                          value: DateFormat('dd.MM.yy')
                                              .format(store.currentFinishDate)),
                                    ],
                                  ),
                                  Divider(color: Colors.black.withOpacity(0.5)),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextHeadline4(
                                          value:
                                              ' ${store.currentFinishDate.getTime()}'),
                                      const SizedBox(width: 10.0),
                                      ElevatedButton(
                                        child: const Text('изменить время'),
                                        onPressed: () =>
                                            store.setTimeFinish(context),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          TextSubTitle1(
                              value:
                                  'продолжительность смены ${store.currentDuration.to24hours()}'),

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
