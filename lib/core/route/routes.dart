import 'package:flutter/material.dart';
import 'package:flutter_work_timecalculate/presentation/screens/editdata_screen.dart';
import 'package:flutter_work_timecalculate/presentation/screens/enterdata_screen.dart';
import 'package:flutter_work_timecalculate/presentation/screens/listmain_screen.dart';
import 'package:flutter_work_timecalculate/presentation/screens/settings_screen.dart';

import 'named_route.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes() {
    return {
      NamedRoutes.listMainScreen: (context) => const ListMainScreen(),
      NamedRoutes.enterDataScreen: (context) => const EnterDataScreen(),
      NamedRoutes.settingScreen: (context) => const SettingScreen(),
      NamedRoutes.editDataScreen: (context) => EditDataScreen(
            indexWorkDay: ModalRoute.of(context)!.settings.arguments as int,
          ),
    };
  }
}
