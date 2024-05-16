import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_work_timecalculate/presentation/widgets/result_workdays_time.dart';
import 'package:flutter_work_timecalculate/presentation/widgets/text_fonts.dart';
import '../../core/theme/theme.dart';
import '../mobx/store_listmain_screen.dart';
import '../widgets/data_workday_page.dart';

class ListMainScreen extends StatefulWidget {
  const ListMainScreen({super.key});

  @override
  State<ListMainScreen> createState() => _ListMainScreenState();
}

class _ListMainScreenState extends State<ListMainScreen> {
  final store = StoreListMain();
  @override
  void initState() {
    store.initStore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: const Text('калькулятор смен')),
        body: Container(
            child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ResultWorkDaysWidget(
                        value: store.durationWorkDays(),
                        indexes: store.getLengthWorkDays(),
                      ),
                      TitleViewDays(),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: store.listWorkDays.length,
                  itemBuilder: (context, index) => Slidable(
                    key: ValueKey(store.listWorkDays[index]),
                    direction: Axis.horizontal,
                    endActionPane: ActionPane(
                      extentRatio: 0.6,
                      motion: ScrollMotion(),
                      dismissible: DismissiblePane(
                          onDismissed: () => store.deleteIndex(index)),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            store.goEditScreen(context, index);
                          },
                          backgroundColor: colorbackGround,
                          foregroundColor: colorMainP2,
                          icon: Icons.edit,
                          label: 'изменить',
                        ),
                        SlidableAction(
                          onPressed: (context) {
                            store.deleteIndex(index);
                          },
                          backgroundColor: colorbackGround,
                          foregroundColor: colorMainP,
                          icon: Icons.delete,
                          label: 'удалить',
                        ),
                      ],
                    ),
                    child: DataWorkDayPage(
                      value: store.listWorkDays[index],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButtonCustom(
                        color: colorMainP2,
                        iconButton: Icons.settings,
                        onTap: () => store.goSettingScreen(context)),
                    IconButtonCustom(
                        color: colorMainP2,
                        iconButton: Icons.calculate,
                        onTap: () => store.goCalcScreen(context)),
                    IconButtonCustom(
                        color: colorMainP,
                        iconButton: Icons.delete,
                        onTap: () => store.clearList()),
                    IconButtonCustom(
                        color: colorMainG,
                        iconButton: Icons.add,
                        onTap: () => store.goAddScreen(context)),
                  ],
                ),
              ),
            ],
          ),
        )),
      );
    });
  }
}
