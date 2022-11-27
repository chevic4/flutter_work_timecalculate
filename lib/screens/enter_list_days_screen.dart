import 'package:flutter/material.dart';
import 'package:flutter_work_timecalculate/data/data_days.dart';
import 'package:flutter_work_timecalculate/data/theme.dart';
import 'package:flutter_work_timecalculate/screens/enter_data_workday_screen.dart';
import 'package:flutter_work_timecalculate/screens/widgets/cost_data_widget.dart';
import 'package:flutter_work_timecalculate/screens/widgets/data_workday_page.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'edit_data_work_screen.dart';

class EnterWorkDays extends StatefulWidget {
  const EnterWorkDays({super.key});

  @override
  State<EnterWorkDays> createState() => _EnterWorkDaysState();
}

var data = DataWorking.data;
bool render = false;

class _EnterWorkDaysState extends State<EnterWorkDays> {
  @override
  void initState() {
    initializeDateFormatting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('калькулятор смен')),
      body: SafeArea(
        child: data.isEmpty
            ? Center(
                child: Text('добавьте данные!',
                    textAlign: TextAlign.left,
                    softWrap: true,
                    style: Theme.of(context).textTheme.bodyText1),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    const TitleViewDays(),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (context, i) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) =>
                                    VrioEditDataScreen(numberOfData: i),
                              ),
                            );
                          },
                          child: DataWorkDayPage(value: data[i]),
                        );
                      },
                    ),
                    SummCostWidget(begin: 0, finish: data.length - 1),
                  ],
                ),
              ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              heroTag: "btn3",
              tooltip: 'очистить список',
              backgroundColor: colorMainP,
              onPressed: (() {
                setState(() {
                  data.clear();
                });
              }),
              child: Icon(
                Icons.clear,
                color: Colors.black.withOpacity(0.4),
              ),
            ),
            FloatingActionButton(
              heroTag: "btn1",
              tooltip: 'добавить день',
              backgroundColor: colorMainG,
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const VrioEnterDataScreen(),
                  ),
                );
              },
              child: Icon(
                Icons.add,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
