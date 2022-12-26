import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_work_timecalculate/data/data_days.dart';
import 'package:flutter_work_timecalculate/data/routes.dart';
import '../data/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    DataWorking.instance;
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ru', ''),
      ],
      locale: const Locale('ru', ''),
      debugShowCheckedModeBanner: false,
      theme: myTheme(),
      initialRoute:'/', 
      onGenerateRoute: onGenerateRoute,

     // home: const ListMainScreen(),
    );
  }
}
