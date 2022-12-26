import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../data/theme.dart';
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
          child: !store.loading
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: store.listWorkDays.length,
                  itemBuilder: (context, i) => GestureDetector(
                    onTap: () => store.goEditScreen(context, i),
                    child: DataWorkDayPage(
                      value: store.listWorkDays[i],
                    ),
                  ),
                )
              : Text('loading...'),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                heroTag: "btn3",
                tooltip: 'настройки',
                backgroundColor: colorMainP2,
                onPressed: () => store.goSettingScreen(context),
                child: Icon(
                  Icons.list,
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
              FloatingActionButton(
                heroTag: "btn2",
                tooltip: 'очистить список',
                backgroundColor: colorMainP,
                onPressed: () => store.clearList(context),
                child: Icon(
                  Icons.clear,
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
              FloatingActionButton(
                heroTag: "btn1",
                tooltip: 'добавить день',
                backgroundColor: colorMainG,
                onPressed: () => store.goAddScreen(context),
                child: Icon(
                  Icons.add,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
