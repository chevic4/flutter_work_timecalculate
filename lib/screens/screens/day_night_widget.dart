import 'package:flutter/material.dart';

class DayNightWidget extends StatelessWidget {
  const DayNightWidget({super.key, required this.value});
  final bool value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: value
          ? const Icon(
              Icons.sunny,
              size: 20.0,
              color: Colors.amber,
            )
          : const Icon(
              Icons.mode_night,
              size: 20.0,
              color: Colors.blueGrey,
            ),
    );
  }
}

class DayNightTextWidget extends StatelessWidget {
  const DayNightTextWidget({super.key, required this.value});
  final bool value;
  @override
  Widget build(BuildContext context) {
    if (value == true) {
      return Text(
        'дневная смена',
        textAlign: TextAlign.left,
        softWrap: true,
        style: Theme.of(context).textTheme.bodyText1,
      );
    } else {
      return Text(
        'ночная смена',
        textAlign: TextAlign.left,
        softWrap: true,
        style: Theme.of(context).textTheme.bodyText1,
      );
    }
  }
}
