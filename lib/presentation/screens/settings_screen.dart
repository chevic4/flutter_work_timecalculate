import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_work_timecalculate/const/extensions.dart';
import 'package:flutter_work_timecalculate/domain/services/default_set_service.dart';
import 'package:flutter_work_timecalculate/presentation/mobx/store_setting_screen.dart';
import 'package:flutter_work_timecalculate/presentation/widgets/text_fonts.dart';
import 'package:provider/provider.dart';
import '../../core/theme/theme.dart';
import '../widgets/day_night_widget.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late final model;

  @override
  void initState() {
    model = StoreSettingDate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('значения по умолчанию'),
        ),
        body: SafeArea(
            child: Provider<StoreSettingDate>.value(
          value: model,
          child: const SettingScreenBody(),
        )));
  }
}

class SettingScreenBody extends StatelessWidget {
  const SettingScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<StoreSettingDate>(context);
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
            Textlabel(labelText: 'дата по умолчанию'),

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
                          TextDate(dateOnly: store.beginDate),
                          const SizedBox(width: 5.0),
                          ElevatedButtonCustom(
                              color: colorMainP2,
                              textButton: 'изменить дату',
                              onTap: () => store.setDateBegin(context)),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
            const SizedBox(height: 5.0),
            Textlabel(labelText: 'начало по умолчанию'),

//            //    TIME begin

            Observer(builder: (_) {
              return Card(
                color: store.workDayChange ? colorPwhite : colorPblack,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextTime(dateTime: store.beginTime.toDateTime()),
                      const SizedBox(width: 10.0),
                      ElevatedButtonCustom(
                          color: colorMainP2,
                          textButton: 'изменить время',
                          onTap: () => store.setTimeBegin(context)),
                    ],
                  ),
                ),
              );
            }),
            const SizedBox(height: 5.0),
            Textlabel(labelText: 'окончание по умолчанию'),

//           //    TIME finish

            Observer(builder: (_) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    color: store.workDayChange ? colorPwhite : colorPblack,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextTime(dateTime: store.finishTime.toDateTime()),
                          const SizedBox(width: 10.0),
                          ElevatedButtonCustom(
                              color: colorMainP2,
                              textButton: 'изменить время',
                              onTap: () => store.setTimeFinish(context)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Textlabel(
                      labelText:
                          'продолжительность по умолчанию ${store.defDuration.to24hours()}'),
                ],
              );
            }),
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
                        label: store.minutes.round().toString(),
                        value: store.minutes,
                        onChanged: store.setMinutes,
                      ),
                      Textlabel(labelText: 'минуты'),
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
                IconButtonCustom(
                    color: colorMainG,
                    iconButton: Icons.chevron_left,
                    onTap: () => store.goMainScreen(context)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
