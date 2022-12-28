import 'package:flutter/material.dart';

class TextSubTitle1 extends StatelessWidget {
  final String value;

  const TextSubTitle1({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Text(value,
        textAlign: TextAlign.left,
        softWrap: true,
        style: Theme.of(context).textTheme.subtitle1);
  }
}

class TextHeadline4 extends StatelessWidget {
  final String value;
  const TextHeadline4({super.key, required this.value});
  @override
  Widget build(BuildContext context) {
    return Text(value,
        textAlign: TextAlign.left,
        softWrap: true,
        style: Theme.of(context).textTheme.headline4);
  }
}
