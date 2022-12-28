import 'package:flutter/material.dart';

class WorkDaysSummWidget extends StatelessWidget {
  final int items;

  const WorkDaysSummWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Text('в списке смен: $items',
            textAlign: TextAlign.left,
            softWrap: true,
            style: Theme.of(context).textTheme.subtitle1),
      ),
    );
  }
}
