import 'package:flutter/material.dart';
import 'package:flutter_work_timecalculate/core/theme/theme.dart';
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Card(
            color: colorCard,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Textlabel(labelText: 'продолжительность'),
                  Text(
                    '$hours:$minutes',
                    textAlign: TextAlign.left,
                    softWrap: true,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Card(
            color: colorCard,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Textlabel(labelText: 'смен'),
                  Text(
                    indexes.toString(),
                    textAlign: TextAlign.left,
                    softWrap: true,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
