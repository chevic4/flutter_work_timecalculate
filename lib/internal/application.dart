import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_work_timecalculate/data/data_days.dart';
import '../data/theme.dart';
import '../presentation/screens/enter_list_days_screen.dart';

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
      home: const EnterWorkDays(),
    );
  }
}