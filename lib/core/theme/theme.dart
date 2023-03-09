import 'package:flutter/material.dart';

const colorMainG = Color(0xFFb6dac5);
// day/night
const colorPwhite = Color(0xFFF5EFE3);
const colorPblack = Color(0xFFE9DDC4);

const colorGreyblack = Color(0xFFABB6CE);

const colorGwhite = Color(0xFFE6E7E5);

const colorMainP = Color(0xFFF7D3BA);

const colorMainP2 = Color.fromARGB(255, 243, 247, 186);

const colorText = Colors.black54;

const colorbackGround = colorGreyblack;

const colorCard = Color(0xFFC0CAE2);

ThemeData myTheme() => ThemeData(
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle().copyWith(color: colorText, fontSize: 24),
      backgroundColor: colorbackGround,
      foregroundColor: colorText,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
      ),
    ),
    textTheme: Typography.blackRedwoodCity,
    colorScheme: ColorScheme.fromSwatch(
      cardColor: colorGreyblack,
      primarySwatch: Colors.blueGrey,
      backgroundColor: colorbackGround.withOpacity(0.95),
    ),
    useMaterial3: true);
