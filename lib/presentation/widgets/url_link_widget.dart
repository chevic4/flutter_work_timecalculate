import 'package:flutter/material.dart';

class LinkedStringWidget extends StatelessWidget {
  final String dataText;
  final Function() onTap;
  final double fontSize;
  const LinkedStringWidget({
    super.key,
    required this.dataText,
    required this.onTap,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        dataText,
        maxLines: 2,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
