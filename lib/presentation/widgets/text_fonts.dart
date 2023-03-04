import 'package:flutter/material.dart';
import 'package:flutter_work_timecalculate/const/extensions.dart';
import 'package:intl/intl.dart';

class Textlabel extends StatelessWidget {
  final String labelText;
  const Textlabel({super.key, required this.labelText});
  @override
  Widget build(BuildContext context) {
    return Text(
      labelText,
      textAlign: TextAlign.left,
      softWrap: true,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}

class TextDate extends StatelessWidget {
  final DateTime dateOnly;
  const TextDate({super.key, required this.dateOnly});
  @override
  Widget build(BuildContext context) {
    return Text(
      DateFormat('dd.MM.yy').format(dateOnly),
      textAlign: TextAlign.left,
      softWrap: true,
      style: Theme.of(context).textTheme.displaySmall,
    );
  }
}

class TextTime extends StatelessWidget {
  final DateTime dateTime;
  const TextTime({super.key, required this.dateTime});
  @override
  Widget build(BuildContext context) {
    String _value = dateTime.getTime().toString();
    return Text(
      _value,
      textAlign: TextAlign.left,
      softWrap: true,
      style: Theme.of(context).textTheme.displayMedium,
    );
  }
}

class ElevatedButtonCustom extends StatelessWidget {
  const ElevatedButtonCustom(
      {super.key,
      required this.color,
      required this.textButton,
      required this.onTap});
  final Color color;
  final String textButton;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle().copyWith(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          ),
          backgroundColor: MaterialStateProperty.all(color)),
      child: Text(textButton),
      onPressed: onTap,
    );
  }
}

class IconButtonCustom extends StatelessWidget {
  const IconButtonCustom(
      {super.key,
      required this.color,
      required this.iconButton,
      required this.onTap});
  final Color color;
  final IconData iconButton;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.all(Radius.circular(14.0))),
      child: IconButton(
          onPressed: onTap,
          icon: Icon(
            iconButton,
            color: Colors.black.withOpacity(0.4),
            size: 40,
          )),
    );
  }
}
