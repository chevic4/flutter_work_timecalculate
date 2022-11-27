import 'package:flutter/material.dart';
import 'package:flutter_work_timecalculate/data/data_days.dart';
import 'date_format_func.dart';

class SummCostWidget extends StatelessWidget {
  const SummCostWidget({super.key, required this.begin, required this.finish});
  final int begin;
  final int finish;
  @override
  Widget build(BuildContext context) {
    final data = DataWorking.data;
    var workingDays = data.length;
    var hours = const Duration();
    for (int i = begin; i <= finish; i++) {
      hours = hours + data[i].workTime;
    }
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text('в списке смен: ${workingDays.toString()}',
                textAlign: TextAlign.left,
                softWrap: true,
                style: Theme.of(context).textTheme.subtitle1),
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(format(hours),
                textAlign: TextAlign.left,
                softWrap: true,
                style: Theme.of(context).textTheme.headline4),
          ),
        ),
      ],
    );
  }
}
