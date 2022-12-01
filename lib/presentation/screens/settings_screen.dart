import 'package:flutter/material.dart';
import 'package:flutter_work_timecalculate/presentation/mobx/state_enter_date_work_screen.dart';
import 'package:flutter_work_timecalculate/presentation/screens/enter_list_days_screen.dart';
import '../../data/theme.dart';
import '../widgets/day_night_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('данные о смене'),
      ),
    //  body: const SafeArea(child: EnterDataScreen()),
      body: const SafeArea(child: SettingsScreen()),
    );
  }
}

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _EnterDateScreenState();
}

class _EnterDateScreenState extends State<SettingsScreen> {
  final store = StoreDate();
  DateTime workDaybeginDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('начало смены по умолчанию',
              textAlign: TextAlign.left,
              softWrap: true,
              style: Theme.of(context).textTheme.subtitle1),
          Card(
              color: store.workDayChange ? colorPwhite : colorPblack,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: (){},
                      child: const Text('поменять'),
                    ),
                  ],
                ),
              ),
            ),
        
          const SizedBox(height: 10.0),
          Text('окончание смены по умолчанию',
              textAlign: TextAlign.left,
              softWrap: true,
              style: Theme.of(context).textTheme.subtitle1),
          Card(
              color: store.workDayChange ? colorPwhite : colorPblack,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: (){},
                      child: const Text('поменять'),
                    ),
                  ],
                ),
              ),
            ),
          const SizedBox(height: 15.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Text('назад'),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const EnterWorkDays(),
                  ));
                },
              ),
              const SizedBox(width: 10.0),
              ElevatedButton(
                child: const Text('сохранить'),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const EnterWorkDays(),
                  ));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
