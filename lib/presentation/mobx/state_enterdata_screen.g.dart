// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_enterdata_screen.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StoreEnterData on _StoreEnterData, Store {
  late final _$workDayChangeAtom =
      Atom(name: '_StoreEnterData.workDayChange', context: context);

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

  late final _$currentBeginDateAtom =
      Atom(name: '_StoreEnterData.currentBeginDate', context: context);

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
      Atom(name: '_StoreEnterData.currentFinishDate', context: context);

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
workDayChange: ${workDayChange},
currentBeginDate: ${currentBeginDate},
currentFinishDate: ${currentFinishDate}
    ''';
  }
}
