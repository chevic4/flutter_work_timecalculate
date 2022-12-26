import 'package:flutter/material.dart';

import '../presentation/screens/editdata_screen.dart';
import '../presentation/screens/enterdata_screen.dart';
import '../presentation/screens/listmain_screen.dart';
import '../presentation/screens/settings_screen.dart';

final routes = {
  '/': (context) => ListMainScreen(),
  '/enterdata': (context) => EnterDataScreen(),
  '/editdata': (context, {arguments}) =>
      EditDataScreen(indexWorkDay: arguments),
  '/settings': (context) => SettingScreen(),
};

var onGenerateRoute = (RouteSettings settings) {
  //Unified processing
  final String? name = settings.name;
  final Function? pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
        builder: (context) =>
            pageContentBuilder(context, arguments: settings.arguments),
      );
      return route;
    } else {
      final Route route = MaterialPageRoute(
        builder: (context) => pageContentBuilder(context),
      );
      return route;
    }
  }
};
