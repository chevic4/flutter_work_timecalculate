import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_work_timecalculate/presentation/mobx/store_enterdata_screen.dart';
import 'package:flutter_work_timecalculate/presentation/widgets/text_fonts.dart';
import '../../core/theme.dart';
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
            Textlabel(labelText: 'настройка смены'),

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
                      ElevatedButtonCustom(
                          color: colorMainP2,
                          textButton: 'поменять',
                          onTap: store.changeWorkDayValue),
                    ],
                  ),
                ),
              );
            }),

            const SizedBox(height: 5.0),
            Textlabel(labelText: 'начало смены'),

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
                          TextDate(dateOnly: store.currentBeginDate),
                          ElevatedButtonCustom(
                              color: colorMainP2,
                              textButton: 'изменить дату',
                              onTap: () => store.setDateBegin(context)),
                        ],
                      ),
                      Divider(
                        color: Colors.black.withOpacity(0.5),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextTime(dateTime: store.currentBeginDate),
                          const SizedBox(width: 10.0),
                          ElevatedButtonCustom(
                              color: colorMainP2,
                              textButton: 'изменить время',
                              onTap: () => store.setTimeBegin(context)),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),

            const SizedBox(height: 5.0),
            Textlabel(labelText: 'окончание смены'),

//            //   DAY finish

            Observer(builder: (_) {
              return Card(
                color: store.workDayChange ? colorPwhite : colorPblack,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextDate(dateOnly: store.currentFinishDate),
                      Divider(color: Colors.black.withOpacity(0.5)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextTime(dateTime: store.currentFinishDate),
                          ElevatedButtonCustom(
                              color: colorMainP2,
                              textButton: 'изменить время',
                              onTap: () => store.setTimeFinish(context)),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
            Textlabel(labelText: 'продолжительность по умолчанию'),

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
                      Textlabel(labelText: 'часы'),
                      Slider(
                        min: 0,
                        max: 55,
                        divisions: 11,
                        label: store.minutes.toString(),
                        value: store.minutes,
                        onChanged: store.setMinutes,
                      ),
                      Textlabel(labelText: 'минуты')
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
                IconButtonCustom(
                    color: colorMainP2,
                    iconButton: Icons.chevron_left,
                    onTap: () => store.goMainScreenNotSave(context)),
                IconButtonCustom(
                    color: colorMainG,
                    iconButton: Icons.add,
                    onTap: () => store.goMainScreenSave(context)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
