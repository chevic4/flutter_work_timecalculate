// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_enter_date_work_screen.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StoreDate on _StoreDate, Store {
  late final _$workDayChangeAtom =
      Atom(name: '_StoreDate.workDayChange', context: context);

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

  late final _$workDaybeginDateAtom =
      Atom(name: '_StoreDate.workDaybeginDate', context: context);

  @override
  DateTime get workDaybeginDate {
    _$workDaybeginDateAtom.reportRead();
    return super.workDaybeginDate;
  }

  @override
  set workDaybeginDate(DateTime value) {
    _$workDaybeginDateAtom.reportWrite(value, super.workDaybeginDate, () {
      super.workDaybeginDate = value;
    });
  }

  late final _$workDayfinishDateAtom =
      Atom(name: '_StoreDate.workDayfinishDate', context: context);

  @override
  DateTime get workDayfinishDate {
    _$workDayfinishDateAtom.reportRead();
    return super.workDayfinishDate;
  }

  @override
  set workDayfinishDate(DateTime value) {
    _$workDayfinishDateAtom.reportWrite(value, super.workDayfinishDate, () {
      super.workDayfinishDate = value;
    });
  }

  @override
  String toString() {
    return '''
workDayChange: ${workDayChange},
workDaybeginDate: ${workDaybeginDate},
workDayfinishDate: ${workDayfinishDate}
    ''';
  }
}
