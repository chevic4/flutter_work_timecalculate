// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_setting_screen.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StoreSettingDate on _StoreSettingDate, Store {
  late final _$workDayChangeAtom =
      Atom(name: '_StoreSettingDate.workDayChange', context: context);

  @override
  bool get workDayChange {
    _$workDayChangeAtom.reportRead();
    return super.workDayChange;
  }

  @override
  set workDayChange(bool value) {
    _$workDayChangeAtom.reportWrite(value, super.workDayChange, () {
      super.workDayChange = value;
    });
  }

  late final _$hoursAtom =
      Atom(name: '_StoreSettingDate.hours', context: context);

  @override
  double get hours {
    _$hoursAtom.reportRead();
    return super.hours;
  }

  @override
  set hours(double value) {
    _$hoursAtom.reportWrite(value, super.hours, () {
      super.hours = value;
    });
  }

  late final _$minutesAtom =
      Atom(name: '_StoreSettingDate.minutes', context: context);

  @override
  double get minutes {
    _$minutesAtom.reportRead();
    return super.minutes;
  }

  @override
  set minutes(double value) {
    _$minutesAtom.reportWrite(value, super.minutes, () {
      super.minutes = value;
    });
  }

  late final _$beginDateAtom =
      Atom(name: '_StoreSettingDate.beginDate', context: context);

  @override
  DateTime get beginDate {
    _$beginDateAtom.reportRead();
    return super.beginDate;
  }

  @override
  set beginDate(DateTime value) {
    _$beginDateAtom.reportWrite(value, super.beginDate, () {
      super.beginDate = value;
    });
  }

  late final _$beginTimeAtom =
      Atom(name: '_StoreSettingDate.beginTime', context: context);

  @override
  TimeOfDay get beginTime {
    _$beginTimeAtom.reportRead();
    return super.beginTime;
  }

  @override
  set beginTime(TimeOfDay value) {
    _$beginTimeAtom.reportWrite(value, super.beginTime, () {
      super.beginTime = value;
    });
  }

  late final _$finishTimeAtom =
      Atom(name: '_StoreSettingDate.finishTime', context: context);

  @override
  TimeOfDay get finishTime {
    _$finishTimeAtom.reportRead();
    return super.finishTime;
  }

  @override
  set finishTime(TimeOfDay value) {
    _$finishTimeAtom.reportWrite(value, super.finishTime, () {
      super.finishTime = value;
    });
  }

  @override
  String toString() {
    return '''
workDayChange: ${workDayChange},
hours: ${hours},
minutes: ${minutes},
beginDate: ${beginDate},
beginTime: ${beginTime},
finishTime: ${finishTime}
    ''';
  }
}
