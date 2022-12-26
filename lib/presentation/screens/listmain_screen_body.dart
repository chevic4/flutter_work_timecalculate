import 'package:flutter/material.dart';
import 'package:flutter_work_timecalculate/presentation/widgets/data_workday_page.dart';
import '../../domain/entity/workday.dart';

// class ListWorkDaysBody extends StatefulWidget {

//   const ListWorkDaysBody({Key? key}) : super(key: key);

//   @override
//   State<ListWorkDaysBody> createState() => _ListWorkDaysBodyState();
// }

// class _ListWorkDaysBodyState extends State<ListWorkDaysBody> {

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Observer(builder: (_) {
//         return SlidableAutoCloseBehavior(
//           closeWhenOpened: true,
//           child: ListView.builder(
//             shrinkWrap: true,
//             itemCount: store.items,
//             itemBuilder: (context, i) {
//               return Slidable(
//                 key: ValueKey(store.listWorkDays[i].beginWork),
//                 endActionPane: ActionPane(
//                   dismissible: DismissiblePane(
//                     onDismissed: () =>
//                         store.onDismissed(context, i, SlidebleAction.delete),
//                   ),
//                   extentRatio: 0.75,
//                   motion: DrawerMotion(),
//                   children: [
//                     SlidableAction(
//                       // An action can be bigger than the others.
//                       flex: 2,
//                       onPressed: ((context) =>
//                           store.onDismissed(context, i, SlidebleAction.edit)),
//                       backgroundColor: colorMainP2,
//                       foregroundColor: colorText,
//                       icon: Icons.edit,
//                       label: 'редактировать',
//                     ),
//                     SlidableAction(
//                       onPressed: ((context) =>
//                           store.onDismissed(context, i, SlidebleAction.delete)),
//                       backgroundColor: colorMainP,
//                       foregroundColor: colorText,
//                       icon: Icons.delete,
//                       label: 'удалить',
//                     ),
//                   ],
//                 ),
//                 child: Builder(
//                   builder: ((context) => GestureDetector(
//                         onTap: () {
//                           final slidable = Slidable.of(context)!;

//                           final isClosed = slidable.actionPaneType.value ==
//                               ActionPaneType.none;
//                           print(isClosed);
//                           if (isClosed) {
//                             slidable.openEndActionPane();
//                           } else {
//                             slidable.close();
//                           }
//                         },
//                         child: DataWorkDayPage(
//                           value: store.listWorkDays[i],
//                         ),
//                       )),
//                 ),
//               );
//             },
//           ),
//         );
//       }),
//     );
//   }
// }

class ListWorkDays extends StatelessWidget {
  final List<WorkDay> data;
  const ListWorkDays({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: data.isEmpty
          ? Text('добавьте данные!',
              textAlign: TextAlign.left,
              softWrap: true,
              style: Theme.of(context).textTheme.bodyText1)
          : SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () {
                          // context
                          //     .findAncestorStateOfType<ListMainScreenState>()!
                          //     .store
                          //     .goEditScreen(context, i);
                        },
                        child: DataWorkDayPage(value: data[i]),
                      );
                    },
                  ),
                  // SummCostWidget(begin: 0, finish: data.length - 1),
                ],
              ),
            ),
    );
  }
}
