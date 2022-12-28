import 'package:flutter/material.dart';

class ResultWorkDaysWidget extends StatelessWidget {
  final Duration value;

  const ResultWorkDaysWidget({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    final minutes = (value.inMinutes.toInt() % 60).toString().padLeft(2, '0');
    final hours = (value.inHours.toInt()).toString().padLeft(2, '0');
    return Column(
      children: [
        Container(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('общая продолжительность',
                      textAlign: TextAlign.left,
                      softWrap: true,
                      style: Theme.of(context).textTheme.subtitle1),
                  Text('$hours:$minutes',
                      textAlign: TextAlign.left,
                      softWrap: true,
                      style: Theme.of(context).textTheme.headline4),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
