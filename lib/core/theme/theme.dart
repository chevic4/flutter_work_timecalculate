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
// ThemeData myTheme() => ThemeData(
//       primarySwatch: Colors.grey,
//       scaffoldBackgroundColor: colorbackGround,
//       brightness: Brightness.light,
//       backgroundColor: colorbackGround,
//       appBarTheme: AppBarTheme(
//         centerTitle: true,
//         backgroundColor: colorMainG,
//         elevation: 0,
//         titleTextStyle: TextStyle(
//           color: Colors.black.withOpacity(0.5),
//           fontSize: 24.0,
//         ),
//       ),
//       cardTheme:
//           const CardTheme(clipBehavior: Clip.antiAlias, color: colorCard),
//       sliderTheme: const SliderThemeData(
//         showValueIndicator: ShowValueIndicator.always,
//       ),
//       textTheme: const TextTheme(
//         headline4: TextStyle(
//           color: Colors.blueGrey,
//           fontStyle: FontStyle.italic,
//           fontSize: 36.0,
//         ),
//         headline6: TextStyle(
//           color: Colors.blueGrey,
//           fontStyle: FontStyle.normal,
//         ),
//         bodyText1: TextStyle(
//             color: Colors.blueGrey,
//             fontStyle: FontStyle.normal,
//             fontSize: 22.0),
//         subtitle1: TextStyle(
//             color: Colors.blueGrey,
//             fontStyle: FontStyle.normal,
//             fontSize: 18.0),
//         //      button: TextStyle(color: Colors.blueGrey, fontStyle: FontStyle.normal),
//       ),
//       elevatedButtonTheme: ElevatedButtonThemeData(
//           style: ElevatedButton.styleFrom(
//               backgroundColor: colorMainG,
//               foregroundColor: Colors.black.withOpacity(0.5),
//               // minimumSize: Size(150, 30),
//               textStyle: TextStyle(
//                   fontSize: 18.0, color: Colors.black.withOpacity(0.9)))),
//     );
