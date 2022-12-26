// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_editdata_screen.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StoreEditData on _StoreEditData, Store {
  late final _$hoursAtom = Atom(name: '_StoreEditData.hours', context: context);

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
      Atom(name: '_StoreEditData.minutes', context: context);

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

  late final _$indexstoreAtom =
      Atom(name: '_StoreEditData.indexstore', context: context);

  @override
  int get indexstore {
    _$indexstoreAtom.reportRead();
    return super.indexstore;
  }

  @override
  set indexstore(int value) {
    _$indexstoreAtom.reportWrite(value, super.indexstore, () {
      super.indexstore = value;
    });
  }

  late final _$workDayChangeAtom =
      Atom(name: '_StoreEditData.workDayChange', context: context);

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

  late final _$isLoadedAtom =
      Atom(name: '_StoreEditData.isLoaded', context: context);

  @override
  bool get isLoaded {
    _$isLoadedAtom.reportRead();
    return super.isLoaded;
  }

  @override
  set isLoaded(bool value) {
    _$isLoadedAtom.reportWrite(value, super.isLoaded, () {
      super.isLoaded = value;
    });
  }

  late final _$currentBeginDateAtom =
      Atom(name: '_StoreEditData.currentBeginDate', context: context);

  @override
  DateTime get currentBeginDate {
    _$currentBeginDateAtom.reportRead();
    return super.currentBeginDate;
  }

  @override
  set currentBeginDate(DateTime value) {
    _$currentBeginDateAtom.reportWrite(value, super.currentBeginDate, () {
      super.currentBeginDate = value;
    });
  }

  late final _$currentFinishDateAtom =
      Atom(name: '_StoreEditData.currentFinishDate', context: context);

  @override
  DateTime get currentFinishDate {
    _$currentFinishDateAtom.reportRead();
    return super.currentFinishDate;
  }

  @override
  set currentFinishDate(DateTime value) {
    _$currentFinishDateAtom.reportWrite(value, super.currentFinishDate, () {
      super.currentFinishDate = value;
    });
  }

  @override
  String toString() {
    return '''
hours: ${hours},
minutes: ${minutes},
indexstore: ${indexstore},
workDayChange: ${workDayChange},
isLoaded: ${isLoaded},
currentBeginDate: ${currentBeginDate},
currentFinishDate: ${currentFinishDate}
    ''';
  }
}
