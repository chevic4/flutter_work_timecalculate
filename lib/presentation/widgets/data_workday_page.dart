import 'package:flutter/material.dart';
import 'package:flutter_work_timecalculate/data/data_days.dart';
import 'package:flutter_work_timecalculate/data/theme.dart';
import 'package:flutter_work_timecalculate/presentation/widgets/day_night_widget.dart';
import 'package:intl/intl.dart';

class TitleViewDays extends StatelessWidget {
  const TitleViewDays({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('дата смены',
                textAlign: TextAlign.left,
                softWrap: true,
                style: Theme.of(context).textTheme.subtitle1),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('начало',
                textAlign: TextAlign.left,
                softWrap: true,
                style: Theme.of(context).textTheme.subtitle1),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('конец',
                textAlign: TextAlign.left,
                softWrap: true,
                style: Theme.of(context).textTheme.subtitle1),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('время',
                textAlign: TextAlign.left,
                softWrap: true,
                style: Theme.of(context).textTheme.subtitle1),
          ),
        ]);
  }
}

class DataWorkDayPage extends StatelessWidget {
  const DataWorkDayPage({super.key, required this.value});
  final WorkDay value;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: value.beginWork.hour < 18 ? colorPwhite : colorPblack,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                DayNightWidget(value: value.beginWork.hour < 18),
                const SizedBox(
                  width: 5.0,
                ),
                Text(DateFormat('dd.MM').format(value.beginWork),
                    textAlign: TextAlign.left,
                    softWrap: true,
                    style: Theme.of(context).textTheme.bodyText1),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(DateFormat('HH:mm').format(value.beginWork),
                textAlign: TextAlign.left,
                softWrap: true,
                style: Theme.of(context).textTheme.bodyText1),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(DateFormat('HH:mm').format(value.finishWork),
                textAlign: TextAlign.left,
                softWrap: true,
                style: Theme.of(context).textTheme.bodyText1),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text(_format(value.workTime),
          //       textAlign: TextAlign.left,
          //       softWrap: true,
          //       style: Theme.of(context).textTheme.bodyText1),
          // ),
        ],
      ),
    );
  }
}

String _format(Duration d) {
  return '${d.inHours.toString().padLeft(2, '0')}:${d.inMinutes.remainder(60).toString().padLeft(2, '0')}';
}
