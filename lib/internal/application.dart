import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_work_timecalculate/core/data_days.dart';
import 'package:flutter_work_timecalculate/core/route/route_names.dart';
import 'package:flutter_work_timecalculate/core/route/routes.dart';
import 'package:flutter_work_timecalculate/core/services/navigation_service.dart';
import '../core/theme/theme.dart';

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
      navigatorKey: NavigationService.navigatorKey,
      initialRoute: RouteNames.listMainScreen.path,
      routes: Routes.routes(),
    );
  }
}
