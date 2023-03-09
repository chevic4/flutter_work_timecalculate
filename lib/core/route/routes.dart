import 'package:flutter/material.dart';
import 'package:flutter_work_timecalculate/core/route/route_names.dart';
import 'package:flutter_work_timecalculate/presentation/screens/editdata_screen.dart';
import 'package:flutter_work_timecalculate/presentation/screens/enterdata_screen.dart';
import 'package:flutter_work_timecalculate/presentation/screens/listmain_screen.dart';
import 'package:flutter_work_timecalculate/presentation/screens/settings_screen.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes() {
    return {
      RouteNames.listMainScreen.path: (context) => const ListMainScreen(),
      RouteNames.enterDataScreen.path: (context) => const EnterDataScreen(),
      RouteNames.settingScreen.path: (context) => const SettingScreen(),
      RouteNames.editDataScreen.path: (context) => EditDataScreen(
            indexWorkDay: ModalRoute.of(context)!.settings.arguments as int,
          ),
    };
  }
}
