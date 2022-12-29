import 'package:flutter/material.dart';
import 'package:flutter_work_timecalculate/data/theme.dart';
import 'package:flutter_work_timecalculate/presentation/widgets/day_night_widget.dart';
import 'package:intl/intl.dart';
import '../../domain/entity/workday.dart';

class TitleViewDays extends StatelessWidget {
  const TitleViewDays({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _TextSubtitle(value: 'дата смены'),
            _TextSubtitle(value: 'начало'),
            _TextSubtitle(value: 'конец'),
            _TextSubtitle(value: 'время'),
          ]),
    );
  }
}

class DataWorkDayPage extends StatelessWidget {
  const DataWorkDayPage({super.key, required this.value});
  final WorkDay value;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: value.beginWork.hour < 17 ? colorPwhite : colorPblack,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  DayNightWidget(value: value.beginWork.hour < 17),
                  const SizedBox(
                    width: 5.0,
                  ),
                  _TextBody(value: DateFormat('dd.MM').format(value.beginWork)),
                ],
              ),
            ),
            _TextBody(value: DateFormat('HH:mm').format(value.beginWork)),
            _TextBody(value: DateFormat('HH:mm').format(value.finishWork)),
            _TextBody(value: _computeDuration(value)),
          ],
        ),
      ),
    );
  }
}

class _TextSubtitle extends StatelessWidget {
  final String value;
  const _TextSubtitle({required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(value,
          textAlign: TextAlign.left,
          softWrap: true,
          style: Theme.of(context).textTheme.subtitle1),
    );
  }
}

class _TextBody extends StatelessWidget {
  final String value;
  const _TextBody({required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(value,
          textAlign: TextAlign.left,
          softWrap: true,
          style: Theme.of(context).textTheme.bodyText1),
    );
  }
}

String _computeDuration(WorkDay value) {
  final currentDuration = value.finishWork.difference(value.beginWork);
  final minutes =
      (currentDuration.inMinutes.toInt() % 60).toString().padLeft(2, '0');
  final hours = (currentDuration.inHours.toInt()).toString().padLeft(2, '0');
  return "$hours:$minutes";
}
