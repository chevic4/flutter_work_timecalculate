import 'package:hive/hive.dart';
part 'workday.g.dart';

@HiveType(typeId: 0)
class WorkDay {
  @HiveField(0)
  DateTime beginWork;
  @HiveField(1)
  DateTime finishWork;
  WorkDay({
    required this.beginWork,
    required this.finishWork,
  });
}
