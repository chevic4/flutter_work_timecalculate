import 'package:flutter/material.dart';
import 'package:flutter_work_timecalculate/domain/entity/workday.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'internal/application.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(WorkDayAdapter());
  await SharedPreferences.getInstance();
  runApp(const MyApp());
}
