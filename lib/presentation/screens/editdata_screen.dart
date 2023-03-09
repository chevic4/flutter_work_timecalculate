import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_work_timecalculate/const/extensions.dart';
import 'package:flutter_work_timecalculate/presentation/mobx/store_editdata_screen.dart';
import 'package:flutter_work_timecalculate/presentation/widgets/text_fonts.dart';
import '../../core/theme/theme.dart';
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
        appBar: AppBar(title: const Text('редактирование смены')),
        body: SafeArea(
          child: Container(
            child: store.isLoaded
                ? SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Textlabel(labelText: 'смена'),

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
                                  TextDate(dateOnly: store.currentBeginDate),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Textlabel(labelText: 'начало смены'),

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
                                      TextTime(
                                          dateTime: store.currentBeginDate),
                                      const SizedBox(width: 10.0),
                                      ElevatedButtonCustom(
                                          color: colorMainP2,
                                          textButton: 'изменить время',
                                          onTap: () =>
                                              store.setTimeBegin(context)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Textlabel(labelText: 'окончание смены'),

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
                                      TextDate(
                                          dateOnly: store.currentFinishDate),
                                    ],
                                  ),
                                  Divider(color: Colors.black.withOpacity(0.5)),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextTime(
                                          dateTime: store.currentFinishDate),
                                      const SizedBox(width: 10.0),
                                      ElevatedButtonCustom(
                                          color: colorMainP2,
                                          textButton: 'изменить время',
                                          onTap: () =>
                                              store.setTimeFinish(context)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Textlabel(
                              labelText:
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
                                  Textlabel(labelText: 'часы'),
                                  Slider(
                                    min: 0,
                                    max: 55,
                                    divisions: 11,
                                    label: store.minutes.round().toString(),
                                    value: store.minutes,
                                    onChanged: store.setMinutes,
                                  ),
                                  Textlabel(labelText: 'минуты'),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButtonCustom(
                                  color: colorMainP,
                                  iconButton: Icons.delete,
                                  onTap: () =>
                                      store.goMainScreenDeleteDay(context)),
                              IconButtonCustom(
                                  color: colorMainP2,
                                  iconButton: Icons.chevron_left,
                                  onTap: () =>
                                      store.goMainScreenNotSave(context)),
                              IconButtonCustom(
                                color: colorMainG,
                                iconButton: Icons.save,
                                onTap: () =>
                                    store.goMainScreenSaveData(context),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                : Text('loading...'),
          ),
        ),
      );
    });
  }
}
