import 'package:flutter/material.dart';
import 'package:flutter_work_timecalculate/presentation/widgets/text_fonts.dart';

class ResultWorkDaysWidget extends StatelessWidget {
  final Duration value;
  final int indexes;

  const ResultWorkDaysWidget(
      {super.key, required this.value, required this.indexes});

  @override
  Widget build(BuildContext context) {
    final minutes = (value.inMinutes.toInt() % 60).toString().padLeft(2, '0');
    final hours = (value.inHours.toInt()).toString().padLeft(2, '0');
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextSubTitle1(value: 'продолжительность'),
                    TextHeadline4(value: '$hours:$minutes'),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextSubTitle1(value: 'смен'),
                    TextHeadline4(value: indexes.toString()),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
