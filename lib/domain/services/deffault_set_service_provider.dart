import 'package:flutter_work_timecalculate/domain/services/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DefaultSettingsProvider {
  final sharedPreferences = SharedPreferences.getInstance();

  Duration defaultDurationDay = Duration(minutes: 0);
  Duration defaultDurationNight = Duration(minutes: 0);

  DateTime defaultDateBeginDay = DateTime(2022, 09, 01, 80, 30);
  DateTime defaultDateBeginNight = DateTime(2022, 09, 01, 80, 30);

  DateTime defaultBeginTimeDay = DateTime(2022, 09, 01, 80, 30);
  DateTime defaultBeginTimeNight = DateTime(2022, 09, 01, 80, 30);

  DateTime defaultFinishTimeDay = DateTime(2022, 09, 01, 80, 30);
  DateTime defaultFinishTimeNight = DateTime(2022, 09, 01, 80, 30);

  Future<void> saveDuration(bool day) async {
    int store =
        day ? defaultDurationDay.inMinutes : defaultDurationNight.inMinutes;
    (await sharedPreferences)
        .setInt(day ? 'defDuration' : 'defDurationNight', store);
  }

  Future<void> loadDuration(bool day) async {
    final store = (await sharedPreferences)
        .getInt(day ? 'defDuration' : 'defDurationNight');
    if (store != null) {
      day
          ? defaultDurationDay = Duration(minutes: store)
          : defaultDurationNight = Duration(minutes: store);
    }
  }

  Future<void> saveDateBegin(DefaultTime defaultTime) async {
    final String store = _getFromStore(defaultTime).toIso8601String();
    (await sharedPreferences).setString(defaultTime.name.toString(), store);
  }

  Future<void> loadDateBegin(DefaultTime defaultTime) async {
    final store =
        (await sharedPreferences).getString(defaultTime.name.toString());
    if (store != null) {
      _setInStore(defaultTime, DateTime.parse(store));
    }
  }

  void _setInStore(DefaultTime defaultTime, DateTime value) {
    switch (defaultTime) {
      case DefaultTime.timeBeginDay:
        defaultBeginTimeDay = value;
        break;

      case DefaultTime.timeBeginNight:
        defaultBeginTimeNight = value;
        break;

      case DefaultTime.timeFinishDay:
        defaultFinishTimeDay = value;
        break;

      case DefaultTime.timeFinishNight:
        defaultFinishTimeNight = value;
        break;

      case DefaultTime.dateBeginDay:
        defaultDateBeginDay = value;
        break;

      case DefaultTime.dateBeginNight:
        defaultDateBeginNight = value;
        break;
    }
  }

  DateTime _getFromStore(DefaultTime defaultTime) {
    switch (defaultTime) {
      case DefaultTime.timeBeginDay:
        return defaultBeginTimeDay;

      case DefaultTime.timeBeginNight:
        return defaultBeginTimeNight;

      case DefaultTime.timeFinishDay:
        return defaultFinishTimeDay;

      case DefaultTime.timeFinishNight:
        return defaultFinishTimeNight;

      case DefaultTime.dateBeginDay:
        return defaultDateBeginDay;

      case DefaultTime.dateBeginNight:
        return defaultDateBeginNight;
    }
  }
}
